Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729482;
	b=4YSJbGk0lN4gvbhBWwaKG2VbX6HX496TN7/COWG3YfTsSZNc8VsUcsKNGduni4IvcLp7
	 4ms0K+RY5/pat9QbU/IVESaS73rz97MPQ56PrWikuBOn1a9qUJY4P66zkE5gBhnI4eAJs
	 BflItNlq4CD3p298ID9rvYFPkXTVbUjJRxn1EwaR00pkRqehhhR7jhUlrmpXxdZiuozxT
	 cmGnBpjdKtn/WHu0bdERsxbMu5Vffne6PAX0celn6wszVyXdprPhE/3kjZrPosKoUXtqI
	 MYE9iQStWqVTKUj5SkCwTqngG9ftqY+qQLHOKau4pcjdAcedvPbIovA/jVpo/cSmOqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=UYJTRpYCZNTbQQiix5R88SQ1NUZI9ZYUAhpcRTfR3qA=;
	b=QWAeToH2rSE7oeJ4Pp3P2oqhauBBn0Yh1BPFavbQylpLtEhoN58dJAqeA2ctcWRHKSqj
	 TJVlfUsfZP/XKum3ksl11CP1RS2SyzvI2FFjxP3DdgfkCNtkS7rH03bsZgPhM5KlnqFCc
	 AONKU7xP9c2SCTaAYeyZwGxNuUlKm5JhetrL4xB6EHJd6TdPWjig7N4aTYgre08BznK91
	 HyQAmUcqndVGvh+wlD0M+j+qMxQbn0xzDeb4xpp64FxixaRczZYheIHKzfBPJepHRvl/F
	 GiKc5l2zUxbYxRhf5wItVmCfaRdWuQvx5d+M1PvtA7wC02B9BeRknn2kO4+Uk6pGtzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="P1QbyE+/";
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59563606A6BE
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 21:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59563606A6BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P1QbyE+/
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-382afece6d8so1527379eec.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 13:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729481; x=1796334281; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UYJTRpYCZNTbQQiix5R88SQ1NUZI9ZYUAhpcRTfR3qA=;
        b=P1QbyE+/ZmZHXBAetcgcFJcSma35+komyh3M/D3cAlQBYTKdH2dBqUKPv7ssH5/Dit
         hqAr5iGuk/2kXi7qcPizrV+eztl6Lv9vK+BEn8XX9am+s1wCz31+8CvEica98HDq6F3E
         wT7g9EyOHWWgaLowjY8x8ERdBgr36dRTEBScqxJEdZLm9wthRgCVREvjGghKXdKU7Fp/
         0wdmI6kd6L9tgwxG9v6g9XeRWQu302gZv4TWPzZ8WChgPFaD6KsTmq3HjcNdf6l5Y9dd
         4Fqvo2jBhSp2YalxqxJcIEStoPHLN/BI35026hDGBmriCJQY7PnpcUNd1qsRiJZ9kzwa
         O5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729481; x=1796334281;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYJTRpYCZNTbQQiix5R88SQ1NUZI9ZYUAhpcRTfR3qA=;
        b=YNZJpZkFhbbwsNYH1AH/lp2u0o4IknAGhpA29zzGoWniZXjnkbGpp1WbzG/kFdce17
         tSU2H/K7Qa0n/UyPbK2IcAnkZ2JNPwQXXp2Yr/RsRO9C8LLk7RFERK50TYSLFj07l9O8
         SX68P/SOpqP8PhR/h3ZBMOnSgS39n2g9rkkQinoIq45f9p4o08NHY3LDW/GrOVnNpDUU
         tB2T9q2Nou+EDfV712BedByWFwahPheCwVT9EjVVC8Txse0yzShCimE71rJzJ6hIAuJi
         FeeeXBdV99c5RCJWVBX3WhmyishUwu4MnqQefhb51zHOthmDJRtOcUVFWtB2OMH8x30H
         XA8A==
X-Forwarded-Encrypted: i=1; AL+hErGJrCxF/q2L8EfllF3jQgZq25/hvS1sUHA8j3+//6Mhs3wQMYd36M0WCSapyN4tnhAXo5IyW68dgxM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IAi/S0o5ap4HL7mbJ3JF5bfLIcwQR1j/1cu9MJy8G4KnHJUdf
	v/koO3LlAP9Z/ZB0R4bljVEs6u5ytAh/GNbiecmRrRRS5Q1BjSukPHd/
X-Gm-Gg: AZFdTZdfdmNt2AyR6X3HaEm76/2TpRTHDnhikkkTGKR/KcMDPrzrzU6cUrULexE9Zg3
	wru8tR/4kwkQBdE7/VS9K2AfbZM4xo1U5DWjIeZE1sdhbQ8TuunW4zqDX5I8H0s4X1yeuorFeq0
	jiYCiz8CezuSGuqxF8EM9MMkjBZ2k8mGYIa10/qmtPU3bxsQz3YG/1ZCWAATKBBVwANswrTF8KB
	Bjd3oAA0jmARi8+a/ugAO4fnlt+nZRsFIsxGBw3QuXZGQRQf43+zDzjGpaAJMyuEU2Xq5o4Dxsn
	r1YrsenE+s6QaGV68oM2PcdQXVXyWYmaa6Y+3e6CIbcM/8Dl6OyCnQuQn5lpWspFkNkqotLdqJ6
	9M1C6hqEk7TdxDcUQ/YZy/ZkLthxh5sJkrAAC+JBlQBOQELUR/59DyLu0p38nx9F5IXQ/WUyEVf
	87CJnu7GwliHjZTPLdXgkILH2DuayrFa+qUPQcz6xMmVBF51PQkUFaoQJrFKcHE3TqpVLBfgSvf
	aQQNtogkCRxU2LI+zPcG30UZdBiBj7Pz2Rm8j2mYFyccufFYVmQ4nm2PMsgBkxFzaEzl2EJsX3S
	bN4QQOT7n64FJxoy/TBoE3qJVccH0lHkTgEQ8rB7ehkJB6A4g9333LH5Pf4vueM=
X-Received: by 2002:a05:7301:c089:b0:372:14fb:2573 with SMTP id 5a478bee46e88-3856fd5bf76mr21960944eec.20.1795729481384;
        Thu, 26 Nov 2026 13:44:41 -0800 (PST)
Received: from localhost ([2604:a840:3:1e0::1080])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm79578155eec.4.2026.11.26.13.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:40 -0800 (PST)
Date: Fri, 27 Nov 2026 05:44:37 +0800
Message-ID: <73f6ebde526f60ff64064ef602e0cae9.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Guodong Xu <docular.xu@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Icenowy Zheng <uwu@icenowy.me>, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Sarah Emery <sarah.emery@canonical.com>, Ze Huang <ze.huang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Cody Kang <codykang@vsit.ai>,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 12/17] drm/spacemit: add Innosilicon DP/eDP controller
 bridge driver
In-Reply-To: <9ec2f818084f2e723e8b82218a302258.docular.xu@gmail.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <20261121-k3-display-v3-12-ec419e8e96b8@gmail.com>
 <9ec2f818084f2e723e8b82218a302258.docular.xu@gmail.com>
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

On Wed, 25 Nov 2026 20:16:25 -0500, Guodong Xu wrote:
[...]
> I noticed a corner case when testing module unload on v3.
> spacemit_inno_dp can be removed while a process still has cardN open
> (say Xorg or kmscube is running and somebody does rmmod
> spacemit_inno_dp), and the DRM device then still holds references on
> the bridge. When that process closes cardN later, the kernel oopses. On
> a CoM260-IFX:
>
> 	sleep 20 < /dev/dri/card0 &
> 	rmmod spacemit_inno_dp

Thanks for reporting this. I can reproduce it.

[...]
> Other DRM drivers with the same structure, rockchipdrm for example,
> put the bridge driver and the DRM driver into one module. I think doing
> the same here (add spacemit_inno_dp.o to spacemit-drm) is the better
> solution.

Agreed. Will fix in v4.

Cody
