Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439CB2170C4;
	Thu, 24 Oct 2024 20:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729802478; cv=none; b=BGwO/4vqiMu3y5/2W8Q4QdJoad7EiYp2X1Gj9vCLpl6SBn9uTNbnNvTAInlC17U+5OF7E1WF8Sk189aEqKQir2eKKdObeHrgZhU97Y+qfcfsQHv60slp0UXoPOyx5SKVy0LLiEiz1bzZ+QJ5DhqWSaXoG/V6kzdHksNzOSAWiIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729802478; c=relaxed/simple;
	bh=2wGqo08YvcqvbNlSwVnfD6yQbCsQjcfQ/VQ98bfcrx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sz8Dt58tuLmcNR2a5ZDPQ3e2WBlMm39meK5q0rywyZYQhNsWpK+X5bAZ3hMA49T1jMWMTmMVgXzIsJFvmGNocu+6uWi8yyH3h1SRQqVn1K1LpPo3qYpH9I5UOQfhGKUXlHYy/d4i3WIDug42MSonDPfCwVH9DJxfa8Ukzb6+58w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CrSEeHgu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CrSEeHgu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96AB7C4CEC7;
	Thu, 24 Oct 2024 20:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729802476;
	bh=2wGqo08YvcqvbNlSwVnfD6yQbCsQjcfQ/VQ98bfcrx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CrSEeHgumaYEhfER/YsDnXgcdHp3i3LgTZVbJLGmhameDT/m6MZMR6QNtEAlb+JAg
	 CEqfkOQlPDTgooTpLmPOIHAXNX1WTqWZ/bM4R8rSt1tDdX/4VxufjGd8QOdV+mX6Fi
	 GpL/jPjJdFzGXZHldvH9uZGJu6Oix5TiqtXpYyzuVMY9IQmKZK02rkXUFAat9jSMKo
	 c1ECzXBROcIPi1hZEAhX0wDiDaDcR48msq19vu3oaLnX1WJp1aWm8haMxGmi3KSFT1
	 7iSx6OcCNr6z0wA3/FfTZxTCg//rRmNMNnDIQoSrexBW+lXhuk4uneBC6gy3N6D53I
	 SRczsOrqWud3w==
Date: Thu, 24 Oct 2024 15:41:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-clk@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Scott Branden <sbranden@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Javier Martinez Canillas <javierm@redhat.com>,
	Maxime Ripard <mripard@kernel.org>, Ray Jui <rjui@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 07/37] dt-bindings: display: Add BCM2712 MOP bindings
Message-ID: <172980247555.1013633.6457539285768075938.robh@kernel.org>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <20241023-drm-vc4-2712-support-v1-7-1cc2d5594907@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-drm-vc4-2712-support-v1-7-1cc2d5594907@raspberrypi.com>


On Wed, 23 Oct 2024 17:50:04 +0100, Dave Stevenson wrote:
> From: Maxime Ripard <mripard@kernel.org>
> 
> The BCM2712 has a MOP controller which is basically a new revision of
> the TXP.
> 
> Express that by adding a new compatible for it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

