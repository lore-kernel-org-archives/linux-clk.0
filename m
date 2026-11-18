Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035823;
	b=zFTvXHWHHlvWoXIDHkSHnhINB65MuiCgo074DiUzRobR+TpEYN4op/D3yi+8HtLvoWci
	 rDqe3/llySzE8LTHgkBf8PTtjPIYRRLZzPhP1ar/BApm2H4xRJCm3pGo3ekj+GTAEDSrx
	 BT4XIGTLhligAqbzE7Fg6XhaXxXlUEKfFpFry+0eqi47tfXgK/QwC5LWcOuGDkZ9VU+eD
	 MUCEJoRWGOhElLuM5+OtCLDaRXDTKOQI54AR5GQOtocIdS2gaof4G8rbnTVDVQBO/TuKL
	 xdFvdqOg1mqmX67wCWDsXE+lXShQCFTjx0jpDMSPsUFabtPoThjSZALsaHNT9iaxFMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=AOYoHqd+TEhq9YYSZd05JTs9KMcPqQTIbqKvDzsDrNA=;
	b=prVSgOf+Ch6TaTid4MgMSVQAEE4mCOWjTy+CbWvrIlGhA/x05s1K2PR+E2iCEMzn1ODU
	 SxNWwbIOT1X0njzQklWYwd1N/Ep2Hn9H04+pskslF7mUpUoSAzCvrq4fuVdtHXlN1gr+s
	 lmjdxJ4TilA8QfgzOHUYJPC2Tj/SehCQ2z6QI588ym8p4ze41UgcjsNhBIxHcHnwucYr3
	 BXEiBZCNXSkr+iBCOMs9hl3KLI/JQMPYmOz3RbRsqLH8iN5mvt+6YnimiuGRrziLb5AEc
	 dsEetLyCDZJ16Zv9Pn6KbQm+6dn4HjwidsrqiMNCchHHNtG9qpRKfsGn3C0Vx/n/Pbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hdv4jdP5;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA42606A31C
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 21:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FA42606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hdv4jdP5
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3adc0ac3566so279162a91.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 13:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035823; x=1795640623; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AOYoHqd+TEhq9YYSZd05JTs9KMcPqQTIbqKvDzsDrNA=;
        b=Hdv4jdP5sy08zBfvTne0xomG45Tbd1SP7Lw1QxQiIEaqMHzUWHLKKP1pb5bPGJ18o3
         Z7cgIX0JOKAMgAGkY8GYD8LG45OOJVsRuBguZwtDwir/MfS/T4RFWjFTWmVabRKHN6/i
         m9VD9crrDrCVDJLSJ74eFbq+atvvEZ0lDoAiUOyBNqFLDROZRWxOqhOozmcRGUqOnhOH
         w/1no8qMQitL31Eac27CIrgHXZbkgmAKaNqgZYprs0+nDRr3Obh3WwCugHtc2xm5179u
         aozEwiHn8TIh+3WD3JiobVeFkGOtW2KqSzVMLbaEQBmANt+nwjFiyLk4JMy+ogR+SGLM
         Jgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035823; x=1795640623;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOYoHqd+TEhq9YYSZd05JTs9KMcPqQTIbqKvDzsDrNA=;
        b=AhW2pkzpR6Q3H+LlzADPZQc8t8X3q5GUlRc55gucdaET42G8pAxKFc5g9X9o2/nRWH
         cUHME5+/8yG11UO2U14Dgn5b6Ejow24C7CQ07kKzxVYof4JAjHSAzYfScNvEA5RdDWk8
         3n0ispA+0zb11mnTlTz40QM6BPtFeYkkkWB6+QSSCwUxHvG5rn+DC/zMkdnrtPyMDkCB
         lw60/Eok7V2g1z/OVRmkc8dfvojrZ286P2UW6xjt5kl3UOAfUEWI92N/CL3xTtqABZJ2
         Y+h/Z4X08n6H0K9sQCDLq1+cEs3+ldWlmZ72OOlJMJsv8AdHdAQPixj+7vXQcEWzGrhv
         VNJQ==
X-Forwarded-Encrypted: i=1; AL+hErFPGBk9xrks9EpSunTKc+BIqK7NlZkJTIxXj66UlU/b9jQdxI39m+EhZ2T8wtI1gyDnlBsH21ZSjmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e0lo8j/afTSkGCOkzfVUhTsthh8xNZha+XDbb7tsYSigfRYFf
	IFsabn0FEVgg7xaE+Whvc4ozMG8OAH0ALMTpggSVXZFhRliBbyZKPHD8
X-Gm-Gg: AZFdTZcKG+TDynofqD5RaE9MiM3l2OS1oX1ylMMkyGYUw8XC07ig25EGFT7VFVm72SA
	vYtCLMjDio8AQmdsg6+XGo6sh1ywxP1u0nNiVkOsuiyjcJWhoSztUniMAuQemwGBp6+fpKSyCfZ
	Nye5L1HlGxPGjkIl7xQIs74ByF3TfwVW3Wh0OH35iGYWdEWmzEYBnCnwv6UT7NV3Ys3iHwXeK7n
	/Jbe1KLcv4m/AeRC15Y8Rg4DuydCgdVF1wob8RJSiKTDMs78tL3VOMyl8PEriXwPuF7GXkdu9lp
	s/ulkZ7gVNcQ5WCYr8zwD85Z17zhONlbtKMFTOzPJOt4e0kPJtveOPv1wYYAfgvkzPesdsKTwz2
	BPPMR11QJrUILc9JdivXcsLGfVj+31st6CBwwHQ5P3UONWEFeFkjKCDYvzJEdn4m7MMEVmIF+4L
	POsIqXsCehaNuUhWd0tUCwvd7IOpN+bSYnsYR8sfZo7k3Yl+dnPTkyswZj7guLOvhk8X7u5IFXf
	F9+55kpiiszM04Ufu9wBkswSHFemk3frr3OcH2oJYQZ3xBwfvFr/gR1c9Xn5oMD4rr9bXcRR0Cn
	1SM=
X-Received: by 2002:a17:90b:3c81:b0:3ac:80dc:f419 with SMTP id 98e67ed59e1d1-3b3d07aa355mr3694363a91.25.1795035822845;
        Wed, 18 Nov 2026 13:03:42 -0800 (PST)
Received: from localhost ([2403:2c80:6::107b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3f7066ef3sm865257a91.11.2026.11.18.13.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:03:42 -0800 (PST)
Date: Thu, 19 Nov 2026 05:03:36 +0800
Message-ID: <5167ad548a578a23ed8d5172196b36f0.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 08/17] drm/spacemit: add Saturn DPU core types, cmdlist
 and display MMU
In-Reply-To: <0dc12950-68e7-4c30-9138-23539e676e1a@suse.de>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-8-327d7910bf71@gmail.com>
 <0dc12950-68e7-4c30-9138-23539e676e1a@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Thomas,

On Mon, 14 Sep 2026 16:10:25 +0200, Thomas Zimmermann wrote:
> Hi
>
> Am 09.08.26 um 15:14 schrieb Cody Kang via B4 Relay:
> > From: Cody Kang <codykang.hk@gmail.com>
> >
> > Register programming of the Saturn DPU is batched: the driver builds
> > per-module register lists in memory and the hardware command-list
> > engine replays them at frame boundaries, while scanout buffers are
> > mapped through the DPU's private address translation unit (DMMU)
> > rather than scanned out by physical address.
>
> I've looked through the code in patch 10. How does a plane interact with 
> the hardware? It apparently has its own command list, but there's mostly 
> code for the CRTC update.

Thanks for the review. A plane programs the hardware through a
command list. Its atomic_update fills the list with the registers of
the plane's read channel, the driver points the command-list engine
at it, and the hardware replays it once the driver raises
config-ready.

In v2 the plane only fills its list; sorting the lists and handing
them to the engine is done in the CRTC update, which is why most of
the code is there. v3 will move that into the plane: each plane
builds and submits its own list in atomic_update, and the CRTC flush
only submits its own list, for the composer, and raises config-ready.

Cody
