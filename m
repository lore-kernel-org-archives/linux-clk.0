Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490687;
	b=i+Y7yTS2GJajPz4QOQKMF6obuiYYkUtgXjkS8lgM1RISl2/pJXNn+9NgD0Ff6C2yOdOV
	 gOgcwD/MbkZFQpZ8qYMTo1FAcd/3I9EagCXU88qTtuzqUhcyvSJhA3PNaagF9cThga69H
	 VTYqRoen+fEhnFmvfKCTpUQYjpcJISoHbDucD2tV7SSu8RnIpk1RkbzpM/djKswO/2gwh
	 /EihIt1hOy0GRxFv6t+zP+8BTOy/Ova1oIRTXkzUxvym2DAlbIqOoPLHtpPTaFVdf96VW
	 qASD4/8B1JKPdlKXqibbSybRNatHVHKrvJ3KAmjTSjFakKnvnwO/zGy1+efN81RnV9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490687;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=4m5/EFtVtJMcX32G0Py/nICnHfPv/lKNQS3VJ6V35d0=;
	b=ph8WKDddjASY1HEtH16F5Gs/c5v4vSghaUQk+YCB47BkIoGbm0n3iIjQ+r3x9Z6zyyCt
	 s3U5WE3efJjV1PuZ91fDhhN1F6DIXeLc36LVPe0xNGQmcUn5UYDB+Dx4oqPhaa3PNFcCv
	 AU6WK/8nhx+Qr5HEIr+2HH3Kbwp3RY/e4/m4exH62rJVpquI+Z3HEGmvPElYJ2U7uIMTF
	 vWa9wLGk6FIe7SBsnQ1+SvlCoZCery+8cX7nPHMZDXOxAyTFIW2HI4ZyCVAS0hm3t4SyH
	 sSqdsq5NJjeNeYA5vzOx96qMU60faRbpsO+8SwtJpjBvrrsQ+yGALL20Fktexqa+11A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868B5606A880
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 13:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 868B5606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b6e7a05225so5729991a12.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 05:38:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490686; x=1795095486;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4m5/EFtVtJMcX32G0Py/nICnHfPv/lKNQS3VJ6V35d0=;
        b=sTdOQqV4ggvcVN2KJWiXalVy+nfuY0ddT56upCcloDUll4KIQNPwkxw//QO0PX6Jxn
         m9WXIEt8A0H8QoG+Ep1nZlbYbEKQ3V2Y/uVbrU2oJdE3D43EZi1olgdXgUlegO/Dxek9
         iX65RgiVFdhNa3T4bWH+VO5hz003wQTszWO09mm8HQjy5SXsJTyJSM3cDrPISXgWFoDU
         /JKtIcKtZSa4OSvJvWo4RPXxLlsOyw3QWA77PvTEXcO6txINX0TdvzPeDJVH+Zh7izjA
         9kE518px0a9K6n4okBFa5rQnm/TsIK6TUSQYDKEqPU9uK+avqkWrewWeFBv3Il7zlx7a
         C+lg==
X-Forwarded-Encrypted: i=1; AL+hErHqLqirH64vQDyqhfDhg4DaNGEVrZ1v1hHHub14h1hmYffbkVnmSvp++47z/9PYCFAmHY17N9T59Ok=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xJaq9SAYyCX/V3Lcuu+GR1k7jeFrMbNhLKcDOgR4JMsFWl48V
	58+nubcdVZ/eRWcXNowq5aDyi4wOtqAHxtAka1KvKZXzy//c+2M3NypmP2Su2ryuneA=
X-Gm-Gg: AYBFou2vmVG1CJmJeC8y0aCziHFbmOTdBBfPjYuC6GN+qqc8qrUetKQs0/PVNTI66sK
	xvD3Ufa16XJ15kSjSc+MuyGi7fondxRmI6PiuU/ZCRepO9//tavpefKTglXMyUxQpT8upLc9vch
	OS1nfB0U57HTCUo7kGNf0zPlFovmG+vj54T+8hM8NCxAbbFx4lbCRa05tLb4fKhksFK5VOY4sjz
	OA9dh6cEKGOQtxQ+w/dinfM939Lv9udNC6C9QszzKIQ/DOBL3DHoV/2QDy6e35r9dX9UGtX+rrj
	tNEsyFfdSNt0zJ4IHDmTsCR9ConTMZHU16BZsMZsMuobnrDgkDOKTCNnuxIQahZAbZY/MTC2XXb
	98hWB2ToqMUJ5Ijh5hGdNkGA2wMvalQuh7Wka3LBhvNY7BUaKLblBRLTgxEy0blW7cMOMVyvH3R
	zlfdbaU7rIY9IvjGNQGkR5ahVHD+zOZuOzUFF7p0ayni0mtxPert0jEm5vk6WwjNdGswxTSXUdn
	sjnzLiKFZEVrGvIPZel2Pj8OFEi7mHbK38lGhdZ1VYsFjqZExhemqNifRrqwFgh3Y6aNJ3xt8+i
	evY3YOZvhGp+lEh+9RFfYIxQLRHmdaascXVFkDwaUzlPhWUIuaODbjUNmmwZ32ZIbkA=
X-Received: by 2002:aa7:c4c7:0:b0:6b1:b75e:e0b9 with SMTP id 4fb4d7f45d1cf-6b7775ea265mr3175692a12.29.1794490685784;
        Thu, 12 Nov 2026 05:38:05 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7b23bc254sm329681a12.30.2026.11.12.05.38.01
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:38:02 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so6064546a12.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 05:38:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEqjto5IkVyEkL3EXTG/O4i3R1yDEQJ5FWorDarKtp9ouwJB+5gRotet2aqoK2KI4JOcqJ53FhmCfo=@vger.kernel.org
X-Received: by 2002:a05:6402:1bc1:b0:6b4:5a9c:4e44 with SMTP id
 4fb4d7f45d1cf-6b77770644dmr2967919a12.37.1794490681628; Thu, 12 Nov 2026
 05:38:01 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 14:37:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeX=6DCLv5GZo1UFU2Nn1Y4zGxCMovxyQGefO+JpuZ8w@mail.gmail.com>
X-Gm-Features: AclHuK8Bvm66uPuRAPPxi-MPPvPl-KdDJtyohfMgnqBqTlOChWJE1Vd3ab7DaZs
Message-ID: <CAMuHMdVeX=6DCLv5GZo1UFU2Nn1Y4zGxCMovxyQGefO+JpuZ8w@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] media: rcar-fcp, vsp1: Enable on R-Car X5H
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Phong Hoang <phong.hoang.wz@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Mon, 9 Nov 2026 at 14:34, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> This series is based on Geert's
> "topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v4-rebased" branch [0].
> A branch including this series is available here [1].
>
> This series enables the FCPV{B,I,D} and the VSP{B,I,D} blocks on the Renesas
> R-Car X5H SoC.
>
> This has been tested on an Ironhide with the vsp-tests test suite [2].
>
> Full summary:
> /dev/media0 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media1 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media10 (VSP2-I): 157 tests: 150 passed, 0 failed, 7 skipped
> /dev/media11 (VSP2-I): 157 tests: 150 passed, 0 failed, 7 skipped
> /dev/media12 (VSP2-I): 157 tests: 150 passed, 0 failed, 7 skipped
> /dev/media13 (VSP2-I): 157 tests: 150 passed, 0 failed, 7 skipped
> /dev/media14 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media15 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media16 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media17 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media18 (VSP2-B): 127 tests: 116 passed, 0 failed, 11 skipped
> /dev/media2 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media3 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media4 (VSP2-D (a)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media5 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media6 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media7 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media8 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
> /dev/media9 (VSP2-D (b)): 114 tests: 99 passed, 0 failed, 15 skipped
>
> The last patch checks the device revision and prints it, which is useful
> for debugging but is unnecessary processing for driver operation so it
> is marked as DNI as well.
>
> In v3, most of the patches have become DNI because they depend on wip
> cpg and mdlc driver work. The non-DNI patches are targets for immediate
> upstreaming though.
>
> In v4, thanks to Geert's new rebased branch, all the clocks and power
> domains that were in DNI limbo have now graduated from DNI status.
>
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v4-rebased
> [1] https://git.ideasonboard.com/epaul/linux/src/branch/epaul/v7.4-rc1/x5h/vsp/fcp
> [2] https://git.ideasonboard.com/renesas/vsp-tests/src/branch/epaul/fix
>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>

Thanks for the update!

> Changes in v4:
> - Change the clocks in the dt nodes to use SGD1 instead of SGD4. (see
>   patch 1 for details)
> - Removed "clk: renesas: r8a78000: Add clock for FCPV and VSP for SCP FW SDKv4.36"

And it still works without providing these clocks because the fcpv
and vsp2 drivers do not manage clocks, right?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
