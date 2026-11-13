Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602117;
	b=KAV89nMITtSrDRTlbljTlMVppIzH7yFkTzHvyULcG55EvaF5LoVrfZprlRQlA3Tml/7Z
	 PEwu1eruJRQjImw8SEBZuIXYYzNXNzYWhZbbpmqtBdfZbgTI35u5IPQ8kMa3MWIIJLlAC
	 cqV1e7jhzZfi8D5jD7uv6kdqWGhCMDwLMlwfY76ZypaEDijJjbCLV2gHr3yK4zRMN/fqE
	 ArIeapc+fHXZzlukSnsQ9HTwTS3tbGMpk2RPuDsWlwLck1LF2trfs/V2sJsVKTD1trrh0
	 4cfxBkr7sy8j5KFYRaOO/ORD4CRHQjTNKyaKD+RcTR2trtaX52NTxeO39fh8youRU8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=v4l0l6/0LSTjMRIJU8wqE1PZYCYMuyzVKSvXtjgLdxw=;
	b=wrAM0DUpiJlurJiEqJNrLqsj7ILyAntSWr2+B4HPKoSE0fBiFZ1+p6VAyfDyae6U0Ifl
	 hQTjn1zvqp1YjJwW2cM3SBWl2ZAIXdT0yUeo99SDpb2WGXTfHsbDZQ7OPr/I3ikaG+P2s
	 GqaG7oQhYIJpoFoReYdlaMszkBgObmmRuPZu7kH+GzUhN5RObjQ1pP1L4n07wGCh08oW3
	 UQrkPc4wGlWknvKGfB3gWumxp5B8DxSLCNt7xCH5Qkj7rh1J1GozPUMzWnycToRP3oI+7
	 64M8y2Ssy+jelb4oagjH1Z3f+FwmyG8YGB262wltFTw62nDGn3pcQ1f5aC/6ng4/0gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ySgiZkB7;
	arc=none smtp.remote-ip=209.85.167.195
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82216606A88E
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 20:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82216606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ySgiZkB7
Received: by mail-oi1-f195.google.com with SMTP id 5614622812f47-53dbe9b8d6eso2040808b6e.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 12:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794602115; x=1795206915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v4l0l6/0LSTjMRIJU8wqE1PZYCYMuyzVKSvXtjgLdxw=;
        b=ySgiZkB7BCqGrgohYd+sTkPA5ZgC0kFB6wcMtolG1eyoxdzwb3khT2CbDiQcwPJvOt
         Sa9KE9w8C+vV5dfU8AKU54E9RgA+h98OvU65JPR4I3CcmGKRG63xoqiy8YmCWCRCtVzZ
         58zZWWwA91hka3O9HZmDRZFHZ0DIyC+5EQCTJTWVadY/JclKCA1XQjap5UL8FfM50XFL
         e5UKOoKs4szQKmIFAoWQMI1BQjY1FaSKY4bQbTzuk8NdGWrVDvrL/UropW6A9P6qXQxI
         MnYTWBKH9sNN6d6lkiZ1lbzNb+w0Q78C4MxYJW0/zvJSgOTrc0/arPb7p8AsGO1ihauS
         DWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602115; x=1795206915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v4l0l6/0LSTjMRIJU8wqE1PZYCYMuyzVKSvXtjgLdxw=;
        b=Cj+zGKAJwWC7YRxCuOSbhsS5hb6WtwAUVMkIdNYzFBrOV4UMU4OQvjVMUvDXrynMrU
         fDJMGmY/r8IJ6mjCNhIKj05BJng/bunHZO6HHsCMM6kc6x3uY45/pG5OuZSffSbqUhZY
         pTsraOQcz7aRlZryp8ce5xNYcqrXnXZICvWafZ4RLH6w4d05YVxC8qhMfmxk/QUcMifG
         cP/lODgQSvjpdBR9hgpzxPesXEtLgoj5rovEaBxJsoQq6yoDkmtWqa5zgLSvmggavnqw
         iB5rz3J/ROmrbGG/7BU+HJcsH+6KKPTo5GydnqEAvYkpDxOQusKYORPdqEUQIfVpR81E
         IhyQ==
X-Gm-Message-State: APuU4Z+63RCAGJxBcRCM5AE1iz0/7lY50WFhC+0w1otHH7Q74ep7Eymt
	yWsFuamai0LNDRgWJIPcvVyQOh0ay0A1zU45CuqJP+RxskEULQSKJpOj
X-Gm-Gg: AYBFou3h3cpMk2Mf1cK3JJaxF2hDd4U+su9DXmVRVum13A6YcCKoVXDOgIHoHZTdC98
	7T2pAEdfCKs07vV/jRk4DYcJblzAfGJbQnJYFWgC/N/z/Qq8UTNHZV3sG+4wU412bY0GjPvjllM
	q3R/owAd7EBJb3VCvUdZ9LzFRHwlZ66f2gMYj0J7DDUoFMGOfAleJpqi6T7KwwDPUOQmSCD+fAD
	RhaOI9L84Oz0UPkjTmnQn3C6dDJBRv1yAqfgxiw0G+oVWVrDFtdGbcvEnss6hX/U28aXtahgJLZ
	yxmmcHctgdK0DI/Op0hmUgO3sY2mPzlHtotkSXJ7Ae1vo+YWs+TVj/OApFZbhTPranXjU/GPs5y
	wF+4dgNt3DhbzI5HMewicY4qP/CkmxYjhk/T6Jrx78CZjHjNcKJYGQvzRhXu0/ZZeQ0DP2u1ujS
	je8g0+gfjjy3428yFvca5H0+bpAsx4Q0sD82tWPfMyHwQg5PghEq+HUFoF2QncTBmwFqZOtil1/
	XewusDXidUaXo+Val1rj3VQU8XzLp4p/WpTBM4zWuxYUQWwzR+iINBKGIRaorusWdeGkZrmWV1M
	xYwtb6tepkZ/vJ1/4lS0LOJvCB98MK/8EQAJ0bN77VwK2uy/VdRj/IrXCEd3ZlIwdBhsjCn7vlT
	4s8dlpRnHvNXLiF2qVyE=
X-Received: by 2002:a05:6808:1691:b0:4d6:9133:cfea with SMTP id 5614622812f47-56cd8ed24a4mr4376780b6e.47.1794602115430;
        Fri, 13 Nov 2026 12:35:15 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm2712225b6e.13.2026.11.13.12.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:35:14 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 13 Nov 2026 14:34:56 -0600
Subject: [PATCH RESEND 2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask
 width
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-mt8173-fix-dds-mask-width-v1-2-c8d1e3288df9@gmail.com>
References: <20261113-mt8173-fix-dds-mask-width-v1-0-c8d1e3288df9@gmail.com>
In-Reply-To: <20261113-mt8173-fix-dds-mask-width-v1-0-c8d1e3288df9@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794602109; l=1505;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=6k5SPDasHR10JbeQ/goG0GjfXjoojCF7pZ/1g9TWB+w=;
 b=GGeJS8jm21rjpv1QyTbpsKBtZCTmbEes2ARBh8p1OfaWD0t2XZ4J3BHySxW23bkyOdUv48ruh
 PRoIkzSIg1UAt0oRD1ii2tTNNj083KeKa67msj2r1YTGbGXjFo0ryOP
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

All eight PLLs in mt6795's pllfhs[] have pcwbits = 21, so the FHCTL DDS
field is bits 20:0, but _FH() declares .dds_mask = GENMASK(21, 0). As on
MT8173, new_dds from mtk_pll_calc_values() is always 21-bit, so admitting
bit 21 of FHCTL_MON into the poll in hopping_hw_flow() can only make it
time out. The same mask feeds the CON1 write-back and fhctl_set_ssc_regs().

Unlike MT8173 this path has a user: mt6795-sony-xperia-m5.dts switches
FHCTL on for mainpll, mpll and msdcpll, with SSC.

Found by inspection while fixing MT8173. I have no MT6795 hardware, so
this one is untested.

Fixes: f222a1baec5f ("clk: mediatek: mt6795: Add support for frequency hopping through FHCTL")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
index 123d5d7fea85..ff01cfefc31f 100644
--- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
@@ -79,7 +79,7 @@ enum fh_pll_id {
 			.fh_id = _fhid,					\
 			.fh_ver = FHCTL_PLLFH_V1,			\
 			.fhx_offset = _offset,				\
-			.dds_mask = GENMASK(21, 0),			\
+			.dds_mask = GENMASK(20, 0),			\
 			.slope0_value = _slope,				\
 			.slope1_value = _slope,				\
 			.sfstrx_en = BIT(2),				\

-- 
2.56.0

