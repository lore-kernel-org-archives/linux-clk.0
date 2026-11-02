Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626845;
	b=a2OOzDvhUDa5kUnuPUSYE3RPUoWtIpcidFyROr20i6o0KOvnfJQc5orFo0we+aRJl5Z0
	 rGkHdjWY++8O4dSKbT1WkFaWLOJHIZs03HbgHGCHNGU5TLwExdzBNcqQDs3dBd/DLb8+a
	 j/FWQu5bHvAiMbqpHPYPYE3fxHQmajR6w3Uz7YeecnPV04gS3KTmgHJJVw3OgjeBJFnTd
	 hTXHWzedYVz+JTHehtsbWqCUfnVES3Q9gzZDNRcJGBY7K8gg4yENkKv73O8XhchC471DA
	 AxmVpHtV0nltFdB2+0e9eNofRZz/Mg6h501uBzs1HLlg8+cG7GyV8YtR9HFPECbWYpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=64ks28F3gpyY9hLkkjB/gzIZc4tlOYmHUcdUS0mZjiQ=;
	b=YdXcRiVH2JiEfCvI+ova/gu9jlenyCiC93MSD6RF+q2RSFhHNDpepGZpoNlX6UJ//ytX
	 tYN1utLhwUulMk+iOtZaw6BsKqfdEmue3RevfrEKagmapzuUc4ueWMRc4eaQ/r2c3pD9z
	 gmITFiptWCW2Y5TxRE/YSbnLBOaqmWJfR5y42/vTRRwihNmpvKY+fmhJiMEAz2a/qhPLt
	 TJWpapaEtYlHb3Jin9vBI+9YjJZlLHZa6Ax8tGHpxht63UNazeo8necBVyeB4c3SBkVY1
	 4G9cbdxXmry6lxJD/PGyKTi0/9LNYabWOz5RUEAxmpmWGJPO2W4LniApa5ph2tZWhlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L6MyQrtd;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEE360A3826
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 13:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EEE360A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L6MyQrtd
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so31966595e9.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 05:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793626844; x=1794231644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=64ks28F3gpyY9hLkkjB/gzIZc4tlOYmHUcdUS0mZjiQ=;
        b=L6MyQrtdRgTojq4Da8UNcdHLYgW40/lqqyejq6Ba2wWQQ77JV/8AbrZFrQQilEQG52
         vp0IXvOuuYFNG6czey/PnETBySbY0jG2C0kEDXfvy9AsvFKyHAzaSAKV9FaByaa926Sj
         vWLwz4YpVQIxjiN31GSXSeLGpxjrmvDyooV/8VnRgRLXGknMkeqFGI6WpmvHHbniWyuB
         4doj3edxKYyVA9z+hde5r8T9w3n7J2mtRiMiu3hLPt+Z2ZFUQrkPAhvigbEk9z8n9xUg
         AS4Tug3xzuDf4E5+IuuVWsnj5ZlSaa9Tz1PVw04MbkJCEcDRTnoixavrXvzI5VgVthkl
         JGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626844; x=1794231644;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=64ks28F3gpyY9hLkkjB/gzIZc4tlOYmHUcdUS0mZjiQ=;
        b=u5H/o3NWH6D3kU88WFlFcFUTRgOWoD2jM4O3OHqCvGX+Y3MKqwBW+hThOBjL1rpRER
         eLyXaZbpJVFhCRJjRC3Ikt8Br3+EZHU297HxgdrfMucbPZ26MwIh2BG7iR6rLa+TtHYB
         w+524rNtpaFJ/DDilRCF8T8oS4rCMotLSQzI4ji8RmKBQ9zpZK0SzIB1P6bhK/OreNda
         Dpu4HyAlBzCY/4S3Ptajrn04C+yq6M+pe0XrYAn1/Z9/M85OZmxKiRSA4AIhPEpLofFB
         +DpFEMFckVLR0BXgpbOCC1t8ueyd14qXSLFOcWEecSs7j7Ddy0I8Uejy/divVUFaCk5+
         /ztA==
X-Forwarded-Encrypted: i=1; AKwUvBxFX16w8Wlk1X8vNOz7cLuQ7GJd8u2Lhgvhcz80dg8vRa0DiOJQcU4EjCaGMpxXlCiBcet6F//C/AA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvUjY99q+0jkrpP4xzxQPxEvZM/A2Yx+bcZyxUSbKURLdv636F
	shdrNovhaWOCEVagUeTN5y579xOI/uu0d0BhAxjlHhrpe0C1hOi2X4MiAN7eTHRhFag=
X-Gm-Gg: AYBFou0XnO3EXu0KmiKjZ5HVYQTXzRvFWFd5IE3fq6698jeR/A1Qjs3awM8syAPXD++
	0vx9KQQ2CK5XdnsDLaTzHgQF0B+xFbaziBpzGpUp2TG6vZ39VtCtiPKB2ZXJO0dONMaB8sgu4mO
	f/0AfCv09T1ewqqz/LrDa5SNDcwQ8l5056GMDKAyryGOyEPyKuy3IrJO32lM0ItefXghyqmfaLX
	NM7Q0odmNwcLXhBcFf0wsLem45/UGeeBcXPgMp82I1Zha/T3LeP05KPAXCDN7xXO8bNIgr1Gs7x
	H0xr9PEiSrA9ly3EQjWPvnnJIXtvuQIhDwqLIv64SwWnBZI88qOCcbZDDAt8GYWaa6bl+9L+6rX
	rL4sIQ1NwF8BPjbnHgv9ZZ+ZzWHSwmSSUTf/KQLVkvp6bP5j4b0oGWL6RruYKHQ/TwCTls967gY
	Bu43NRrnGlByBuh0R6oYZyHvnlbN9Pnbv4S+NI3DfxZYRWBihee7evtZutoaIxNUFaNkHU4ChRr
	dRwyqKVzPYNQgpiS2z1fOfa2AhwHM9bv+ZjiDCL/puE/X4dGYxiKspXBCdpbusn7Mt1RtOmiLdP
	FOMI+2FARRh2AWYbKabg/H25C+OWsNLlUEI65SZhYPNXzzckaA==
X-Received: by 2002:a05:600c:6214:b0:4a2:9cda:57cb with SMTP id 5b1f17b1804b1-4ac151a9077mr246967155e9.1.1793626843602;
        Mon, 02 Nov 2026 05:40:43 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea533a1esm189194605e9.1.2026.11.02.05.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:40:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
References: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/5] arm64: dts: qcom: support SDM845 HDK
Message-Id: <179362684245.3310106.2514816704767701626.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:40:42 +0100
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
X-Mailer: b4 0.15.2

Hi,

On Mon, 19 Oct 2026 12:18:02 +0300, Dmitry Baryshkov wrote:
> Lantronix HDK845 aka Qualcomm SDM845-HDK is a hardware development kit
> for the Qualcomm SDM845 / SDA845 platform. It uses the modem-less
> version of the chip (SDA845) and provides a rich set of the peripherals
> and connectors. The DSI panel is an optional addon, so it is being split
> to a separate overlay. To (hopefully) ease merging, the overlay is split
> to a separate patch as it depends on the panel. The base DT doesn't have
> external dependencies.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/5] dt-bindings: display: panel: add Truly NT36850 WQHD panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/79e6e49d681714aec69bdc24a4d1cb592aea4adf
[2/5] drm/panel: add Novatek NT36850 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/cf022beccbd43c27b1e9a4b03ace28bd39504d7d

-- 
Neil

