Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC853EB815
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 09:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785143801; cv=none; b=StB02W28OkNaLwQLFI328OQCqBjh1h7CRbzYrXm/D54aKP2OxkaXEyRnj2EOxh2xhwnh39sL05bgGvm394vGWN6tR1+SSbhlEqiOnr/zMVuAEmjVwqlOCFAQfhehh+v0GKlLA9ljxq1neezCLYKR8xnmOyfj3hF/XUNU+jk3QwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785143801; c=relaxed/simple;
	bh=aIFMPuRdmJNDMfcNywwoN0iQ5141uX9JSYiOoIkP3dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t+B/KqR/YFi3a9h139Jf3fgo7z+Xz5S5PTS4bVVobTHQ3TUQ4TiyTvXP/qRhaYo2JQcQyuiYh2p+Eq5xFnKUVCEJrb2lHUozdlw4dapj8qt9G5jBI4CDCGjDLOJMITPo5mZOOYNWvsdBv96KqbZAIBuDFNBIxur26nw66vFZxjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LS3XaHjZ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LS3XaHjZ"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso2420656b3a.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 02:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785143800; x=1785748600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWdXeAE8uA9DV3aiiuBfjSr6VRPTM+UnFjc1T+sgsLA=;
        b=LS3XaHjZUfViUc1Jhxj7kwksPD2EUslYIXFN2vC48GzOxQ7E02l/MVOS3EwXt91Z1T
         q6vN928vowy1XV04fuTMeMopJHnTgMG8ZWedOpdg2jSN412B6t24AoOa+hg+IR1or+3m
         FoBJku4dbMM2SrxLnJUFi2U0HBOfr4bA19tJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785143800; x=1785748600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWdXeAE8uA9DV3aiiuBfjSr6VRPTM+UnFjc1T+sgsLA=;
        b=KGhUSQ4ly/m2Qu5Isp81hVxcrs9fQMQcUZsvKDhy/3tg4/OrAIIJ/rkisDC5CqE+mz
         SX4fOnEKyRcVYzDVNZzxGbDgeFYbeP1SCUujZDUTWBb6YNYIEKl5Q2KBN4f6xOCIRstb
         Np/2aZxxyLcKK0rdRotv3a0eyIhoAnhuv2eKn3UI2Ohc+i5kLbLzJSJQJnzoURfQooD9
         JWnmnX+2lyEtliyQOmsOT/y/0UZkfuKfrCl/iY5uhwdo5WVBHbM2qVPnTRCRb2Kv4xiI
         ScMM4gw4fSB8zFDnsvImdnmid/6tgkYPSIrM3zXPBqYLifwd5xLicQma24zSLKzEYfbi
         eADQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqc3AIuDzH+si3TeBmlT6zjXq8J5ibI0yUf5N/pdf87AZ09CVxBoP9V8yKy/RfGTf+7B2qoMZC/4/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEMRN3DFkY32GEXq4Tx/jkrIcIVn/k41xDDnMUc3jNODdAWb+p
	k3DO6cVYt14Y1tB3gGt66ZIW3MUukb7zdBZVQ5Divt20OuxKir/wRTillpqZQsyi6Q==
X-Gm-Gg: AR+sD11GBl1YkFI7Oeh4DuFQqzzCPPmOfHg63MZs9qtF7r0eW9bJXTTFVhwbNcMbzq8
	Ft7hVFuTrTJ0rnPe3zrGa2nnHHKNXm3pi5GUHRzi1UaWiVd4x0+l7MbfVVEqN3pwAhFQf/g99bx
	54Wd2F+FdCfQZsYQuQbkCY96iPI2AzTnff1sCLynftz9ht6CUxYNj0tgI7qR+2o6l/Hln7cgEr2
	8lW5cpNwNKhhxJEytsE+aJHbOyDVnOKOePyjxWFVTEJxSMT06EwnGuQArm/9bSVfi/ksEwW19ox
	GSe2/qPaM3b/T6PTZPj3C9PMdEcWkjswAPD98pQGs1tyscpjKIYnENfKT6iLQDkJm4jRYqCe+IH
	eC4bYQTkP64vBOYeE054+oksNuAPonTiiBh8IzspGDrKyUThBgBei7YJnAEnQ08gUil7/Np0SFT
	vd2ah3FwLo2H3tpoyJ6HJo7zaSGXkn+Ku+CkNR6l1PIcPm+BTu7af10qLhPQ==
X-Received: by 2002:a05:6a00:4c11:b0:847:8b0f:2508 with SMTP id d2e1a72fcca58-84e5942eaecmr6235745b3a.13.1785143799693;
        Mon, 27 Jul 2026 02:16:39 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:440:c713:a2b0:6f14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb662329fsm2870049a12.9.2026.07.27.02.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:16:39 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 3/5] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
Date: Mon, 27 Jul 2026 17:15:52 +0800
Message-ID: <20260727091555.1023910-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260727091555.1023910-1-wenst@chromium.org>
References: <20260727091555.1023910-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
of the Series6XT GPUs, another sub-family of the Rogue family.

This was part of the very first few versions of the PowerVR submission,
but was later dropped.

[1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793a43c79c2a.camel@imgtec.com/

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index a6bccb600a57..e9218e0f363d 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -16,6 +16,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - mediatek,mt8173-gpu
               - renesas,r8a7796-gpu
               - renesas,r8a77961-gpu
           - const: img,img-gx6250
-- 
2.55.0.229.g6434b31f56-goog

