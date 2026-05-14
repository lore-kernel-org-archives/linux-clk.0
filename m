Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082A039478D;
	Thu, 14 May 2026 12:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778760093; cv=none; b=UCjfPVk1l58o3XINQMDpqQmh7VRPlFZBlBKxwyEuHdfWxaLPok2UTSWJHn4B4OGIYhsQQBWm1jpy0c2qyNqpPVOmwibTgizXIu0GNEvvnODvlpzyUHQMfF1nQWnU6r9C4lFifFTJCmTzpbGIzMDRWPM2vQw18zZQcDTniZOevKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778760093; c=relaxed/simple;
	bh=cDzJLSWXKBK3yhL4X7j9TNlyzu5oMWNYXLARIumVm8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OOC1JR4PzWf8tgL1E4H2oDPoaFzLpTuncUSFYodWIQnUBBM6Tf6XwV7PHY+1eH37m1L4/vycyMsEQqHh+BZhWPDI8Te6OFjulVJR2H+le9bJ8HKesKXrNDjuitpa14JEfy3cGiBlaMQLRm3Uv11EXRLqWsFIEAn5WqlZnVnTwdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNH/P0/1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNH/P0/1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB5AC2BCB8;
	Thu, 14 May 2026 12:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778760092;
	bh=cDzJLSWXKBK3yhL4X7j9TNlyzu5oMWNYXLARIumVm8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZNH/P0/19SdLtkSwljWdUbMme9P0vOAw3gNrcNjaElXtMfzOz1pQI694D/GiWheci
	 Xm1pjHJmcpzLkNEUXDU7DeZK3/Pf9Y62hQwMOkwXzLZNxK15wjN847tQdEkTLtN4wu
	 q9j9nWYvq3pXNCXvtHGGFj0YQn9tFlKadIiLSk4Le7om1qBqR6mQ6dQSHIFgnPA91x
	 d8TypGmXEM86cKBSLyxsCj8Q7gej+U4Ga0aRayWEh99W1HsMlYKkUDHVW1Y1+k7MZe
	 MKcp6nwllEzefUtDk9BhTUcfrZ0KZjHBVRCHRYYHG1DkC4NzmWsD5Tf+XSkeWBVGG8
	 5WfDe7s3Ez36w==
Date: Thu, 14 May 2026 14:01:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: wens@csie.org, samuel@sholland.org, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 5/8] dt-bindings: display: allwinner: Add DE33 planes
Message-ID: <20260514-impetuous-solemn-sambar-acca3c@quoll>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
 <20260509190015.79086-6-jernej.skrabec@siol.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260509190015.79086-6-jernej.skrabec@siol.net>

On Sat, May 09, 2026 at 09:00:12PM +0200, Jernej Skrabec wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Allwinner Display Engine 3.3 contains planes, which are shared resources
> between all mixers present in SoC. They can be assigned to specific
> mixer by using registers which reside in display clocks MMIO.
> 
> Add a binding for them.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
> Changes from v1:
> - dropped | for description
> - better description for allwinner,plane-mapping

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

