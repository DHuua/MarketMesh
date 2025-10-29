import React from 'react'

type Props = {}

const Features = (props: Props) => {
  return (
    <section className="py-12 md:py-20">
    <div className="container-max flex flex-col md:flex-row items-center gap-8">
      <div className="w-full md:w-1/2">
        <img
          src="https://images.unsplash.com/photo-1581091012184-7a9c7d3f3dc2?q=80&w=1200&auto=format&fit=crop"
          alt="feature image"
          className="rounded-lg shadow-md object-cover w-full"
        />
      </div>
      <div className="w-full md:w-1/2">
        <h2 className="text-2xl md:text-3xl font-bold text-gray-900">
          Powerful features
        </h2>
        <p className="mt-4 text-gray-600 max-w-lg">
          MeshMarket provides model versioning, automatic LOD generation, and
          streaming previews for web and native apps.
        </p>
        <ul className="mt-6 space-y-3 text-gray-700">
          <li>• Auto-LOD & compression</li>
          <li>• Web preview with PBR materials</li>
          <li>• Team collaboration & license controls</li>
        </ul>
      </div>
    </div>
  </section>
  )
}

export default Features