import React from 'react'

type Props = {}

const Why = (props: Props) => {
  return (
    <section className="bg-gray-50 py-12 md:py-20">
    <div className="container-max flex flex-col md:flex-row items-center gap-8">
      <div className="w-full md:w-1/2 order-2 md:order-1">
        <h2 className="text-2xl md:text-3xl font-bold text-gray-900">
          Why choose MeshMarket?
        </h2>
        <p className="mt-4 text-gray-600 max-w-lg">
          We focus on speed, compatibility, and affordability — optimized
          exports and CDN delivery reduce load times so your apps feel snappy.
        </p>
        <div className="mt-6 space-y-3 text-gray-700">
          <div>• Fast CDN backed delivery</div>
          <div>• Multiple export formats</div>
          <div>• Built for production pipelines</div>
        </div>
      </div>

      <div className="w-full md:w-1/2 order-1 md:order-2">
        <img
          src="https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=1200&auto=format&fit=crop"
          alt="why image"
          className="rounded-lg shadow-md object-cover w-full"
        />
      </div>
    </div>
  </section>
  )
}

export default Why