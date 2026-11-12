Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794519480;
	b=wmEsSUagv53I/q0wihoWuG450Hfxf18xuLiTY9Vxo/Zrqbl/gQm93HcPCFlayx9BRCxB
	 lJxYOPd1wd2QAgcFJAVJNeByYiHi2M79HiSrjKmB7HCEj8ER5XpioofSRdwtotdl4b35q
	 qslF1qQ6mTUbAN8y/ICfgSHQovh/W8+fr0sZ8ci5/DBQ2zuxdMlrW15QwpEkMtK5mi0y3
	 jCwJXUXbT0HatoyJPE1jUosp5WW6IF0OpTRQk0LrXij7TTw4HHgrzkUSQ57dYFFZfhXei
	 WUr5DNHLfkJFKHF/8x8d61FtSqOs5eYXLdg4pXrlh6Hybrrgj9rIKwF/GO1psWErp4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794519480;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=oZdcJRMUxxlk1z+2TXuUtGeoqWVbfR50Qnwl3g1KkFc=;
	b=d8y2BRD1+D0X8/hS4f/nHyABD2mMj9w8uBsAuWQT+L+Sclun5rwRd1k7boJicZstiNic
	 FLb5jRe7pbn6aw+I40wRPMBW7ePYf7QIf4gF4qaG2wHoTBFC22F1F0MHjGvSV2ATTxEaW
	 LVbCrscbb+flrgp7lSF3Bg3QqRVX2daCZ7Tfjnq/X2HqF+JLdClkt4f+hwzK7ysuC8fEb
	 Zj5RCpAkChA3x86NUyjy2Q6jazUYDU/1HcD5R1WaXBc9V6ZFGMEsFKONf5qX6WjwxGCav
	 H+G6+/JpyedV+xlRvITQoUR+BcVbCXuOQKK3kgN8josoq0MGrrTGqw/CVG4SYkwbj3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D2C606A32D
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 21:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3D2C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so241807a91.3
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 13:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794519479; x=1795124279;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oZdcJRMUxxlk1z+2TXuUtGeoqWVbfR50Qnwl3g1KkFc=;
        b=AutzisMYkgFLO+oXI9kaRTf9UnCb2dobBzS6I44vK+stTT7V3p0lWrrNdzzFVUSMFQ
         VX4Cr1+sA4ROo/nmsHgbfLBgmQMst6rSJJUvJj177+f3eHxoPgpOUs8mQwKjh3oTALeK
         F92g9gFSJwjIqGUnqfRHGf3KEg9ra211+zpFFkvu0GtMLFsANthF91FMl7fx6MuNXR9f
         mINn67F2TR/Wy0rVGPJxlCZrcbhUzvvQVp6tx0v+eWx85D1CSdzyUIybMNW1SrY6fUNa
         9tlWZdUtySc5XwEVhAzRlseUeqcnJI8Qf0xMPPaaDrXKrs5HNXigk5RKZ6vu/l1WcTc4
         M6dg==
X-Forwarded-Encrypted: i=1; AL+hErFXVy+YmJcmmX/tzXoFfOWPOMvcwf+wmdpZfANJiD5w/rlHoAbr5Kt2428OO7yZWVPG+CRq8Wd0RaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Bvyks4BIZv0VMzXmwKHHc1Cqwe2grd+GuR+djoAtaV3W5p7Cl
	JZI6Ls7s2ZZ3JCFkdsp8AB2LjRxwCknmx5AvdFMuPXdsmKKLHthzo0tYJqoK4Md8
X-Gm-Gg: AYBFou3ucorsVvFO+OfhhEZFzqWnoK1gPS4dT+RnPOy7dL54vgORN15fn0OP1WQtr/4
	RNYZiN4Bz1MsFyB45q9LVX4KdcBPwsWLjlwj4tki1KbMn5eGDUqOgZhJgDcfQ8C5VA0PIZixd4j
	CST2lbGoh1V6SiOeJYarAxwW4WsiRwIHIxe2Vr/RyBYrE7QI8W5blFpInw0JPXVqS1szFBzR5/J
	2sfyXELf0Ck0UrO37E5hieQPwDbuOQnGgpEnRb7eI3MYtmCpjydQ732Csy1Tp5wMHtMo5Ti3Vbp
	/VbQujscQnwaTzp4He64Rkmb/lRORHbNYW4uyuWxDOJvty7QgKYwunRD+CdI9SpA1mevDz96mPl
	ms6tRT8C1yB/OelaMht2y3gcbGf2GOSNKpDPAdkMIku5Uz0NCFJN/Ow3PyVacHLI9cx3IpVmyuY
	5lwu4uYAc3gzpWQhN3babi2NIy+VozFrIxQsM5wdlDcViiCuBs8G0xmGb0mt+UHR5D2A41oe+Gp
	EIFkmu9u+64ojtcLckxBKkOmRBSQ96vZpQZ5mwi3HxAaFG15iCbi3T2Dc/NEyfSFdwW28t6Itv4
	wOpQHT/HRSxJse5X7RFMk9MzldLIx/mTxlhG06cbqlvMyMumtYwFBk5th5fofvhVC8s441t4DR6
	Gb1qP1p9V5g5p5Lww+MBuiPAj8QPfdpS2RoJJLEBr2HzC
X-Received: by 2002:a17:90b:48c9:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b1b0cf38ffmr340859a91.49.1794519478941;
        Thu, 12 Nov 2026 13:37:58 -0800 (PST)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com. [74.125.82.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm6426635a91.8.2026.11.12.13.37.57
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 13:37:57 -0800 (PST)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3791619605cso683778eec.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 13:37:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGXdApLRmV/6Dg4AZFClqowwGknrPtupF4yMVPETgG7HXAVReDjVFtWCDJOaLpl8EDkqZItLXNUI/I=@vger.kernel.org
X-Received: by 2002:a05:693c:6383:20b0:379:8df3:d2c9 with SMTP id
 5a478bee46e88-3798df3d361mr53568eec.13.1794519476959; Thu, 12 Nov 2026
 13:37:56 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-sf19a2890-sysm-v2-0-d2fcb723e4f1@telaak.dev>
 <20261111-sf19a2890-sysm-v2-1-d2fcb723e4f1@telaak.dev> <179444699398.1126566.18079369824329437583.b4-review@b4>
In-Reply-To: <179444699398.1126566.18079369824329437583.b4-review@b4>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 12 Nov 2026 16:37:45 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ79fUPUGG4g+bZYcaMXJHXVh_89NL55MXNkhppMEYDD6A@mail.gmail.com>
X-Gm-Features: AclHuK-qYQ4QvhuWcFcAv5sXFh2xbA3gQD3BM89Iz_DI_n7EaCswO7U9VivUGq0
Message-ID: <CAPY4CJ79fUPUGG4g+bZYcaMXJHXVh_89NL55MXNkhppMEYDD6A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: Add Siflower SF19A2890 clock manager
To: Brian Masney <masneyb@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

> > +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>
> The license is different compared to siflower,sf19a2890-clk.yaml. Is that
> expected?

Yes. The header is Chuanhong's, and it keeps the license he gave it,
with only the identifier updated from GPL-2.0 to GPL-2.0-only. The
binding is mine, under the usual GPL-2.0-only OR BSD-2-Clause. Both
licenses let non-GPL device trees use the header.

> > +#define CLK_MUXDIV_NPU_PE_CLK 20
>
> This is the only one that has a suffix of _CLK. Can that be dropped for
> consistency?

Sure, v3 names it CLK_MUXDIV_NPU_PE. No device tree uses it yet.

Thanks,
Joseph
