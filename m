Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA45142A7BC;
	Tue, 28 Jul 2026 14:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249744; cv=none; b=RFxjH0TFCxuhp/ahmozhC0BxrIktYIinAsTii7GBKnl4xq0Q5WEdFze+xsMmHGj1kuQIqTGRlfe5v62mhjlVjXYRnD11Yxsg/5+V+7BNS1LC2hOQtIoAJ+DqRhpAvr3+ZbNXceWuYmMOrIhvWbRqxksN8TqskpnoSxSdDEXf+iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249744; c=relaxed/simple;
	bh=m4bV5Y1aJpAkAkbvTmoV7jr58zyc6dz0hWZdXobo9Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oex7A6mwCkxG1qKqtP9+ak5H4uKySI+zCRjgGiQGMgJEYiVn5ZT+DCi0LJcNj23xG4Hyu6oAs5w5BomtB0UYVTsLERc7GVp1ezvrP2mnO2sEbUTRcNBSKsHyPjUM6GYOlZhrjwnBp9RiXycmM4zX6u1s8m+o8ZLDHCQzc2ovopI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMtlsPzQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMtlsPzQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09B51F000E9;
	Tue, 28 Jul 2026 14:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785249743;
	bh=DFq1P2GXspIY/uUf473I92xb3+BXZvYdQ6tdZRmrmW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GMtlsPzQy5J8mAtWTLBMWkpqF3++U7zJadHpafD5LQpT2QqDt6MZwZofaXMJ1ar3o
	 StUGgkG8CC9tknhFNhF9Po6nTcJgOI+5i+NXpXaXe4NeRsO92PECw2SeSZU14BJzaP
	 8HUYS0pxhvbyykNJvFcVbaw63O1leZ4U7cR56NbU/qsiK23Wk04yrAzdvj0nubusU+
	 IpHzOd3jlYjG01r7oY46ZwsiJ5zXJW0Y8KNXbvMJ4CBupix0s18e1Ure5PJmkKh+qM
	 JjBY2zqguDaVvzFpKYR5wFpCBgiFOgNbOSyWp9rC+MElVNIGmVmYJbc7Zyh3IeaPmN
	 nUn4G34AAI8Fg==
Date: Tue, 28 Jul 2026 09:42:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>,
	Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	imagination@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Alessio Belle <alessio.belle@imgtec.com>,
	YoungJoon Lee <getfeus@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v4 3/5] dt-bindings: gpu: powervr-rogue: Add MediaTek
 MT8173 GPU
Message-ID: <178524973916.2137541.17965482257032885131.robh@kernel.org>
References: <20260728091804.382753-1-wenst@chromium.org>
 <20260728091804.382753-4-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728091804.382753-4-wenst@chromium.org>


On Tue, 28 Jul 2026 17:18:01 +0800, Chen-Yu Tsai wrote:
> The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
> of the Series6XT GPUs, another sub-family of the Rogue family.
> 
> This was part of the very first few versions of the PowerVR submission,
> but was later dropped.
> 
> [1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793a43c79c2a.camel@imgtec.com/
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!

