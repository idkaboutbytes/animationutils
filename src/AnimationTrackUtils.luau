--!nonstrict
--[=[
	Utility functions for animations
	@class AnimationTrackUtils
]=]

const AnimationTrackUtils = {}

--[=[
	Loads an animation from the animation id
	@param animatorOrHumanoid Humanoid | Animator
	@param animationId string
	@return Animation
]=]
@checked
function AnimationTrackUtils.loadAnimationFromId(
	animatorOrHumanoid: Humanoid | Animator,
	animationId: string
): AnimationTrack
	local animation = Instance.new('Animation')
	animation.AnimationId = animationId
	return (animatorOrHumanoid :: any):LoadAnimation(animation)
end

--[=[
	Sets the weight target if not set
	@param track AnimationTrack
	@param weight number
	@param fadeTime number
	@return Animation
]=]
@checked
function AnimationTrackUtils.setWeightTargetIfNotSet(track: AnimationTrack, weight: number, fadeTime: number): ()
	assert(typeof(track) == 'Instance', 'Bad track')
	assert(type(weight) == 'number', 'Bad weight')
	assert(type(fadeTime) == 'number', 'Bad fadeTime')

	if track.WeightTarget ~= weight then
		track:AdjustWeight(weight, fadeTime)
	end
end

return AnimationTrackUtils
