Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595130;
	b=xqc2V34C5qCnkE3TuLomXsI46lGmfbiMSSo1eT5mQd311cvXkL/AQ+yj/RkwKnMNjs9q
	 9WQ1LWzP1DVpteDhcNWolqwnqxpU/1DtsvL0DG6wRb/ytCoE8PPpSZyC5/InhiSqpETL/
	 ULetIR8RpIWpSZuZlmsUrqHF1IPHAUBhnsMNi4SlSTEtlAKImjf8Pa832K4CuCPsL9j5d
	 cT8C2F62Arxpo6XOIDtO16xlrCesVHTOi9R9E4Ri4TDVof07g5OUfCn5USIUI6oZ9HiCG
	 rqEfLyqKrwuSfpqImVrb6sZohTPsdEP+L8cmpSBsg7DO2hHP9QTPOPFpwC5KM2OIFlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/WLYnDFB5WqiTmstQk3U+Or9EEun2Fd05KTvnYRhk7k=;
	b=Rw8lkvgQ1axVTxf07oHgFpP1ctgaGqsybbr6wyTwBvVyH6XpPVURajF3bTlIUT4o30xt
	 Lt2bXQPVDXQoxTscBPw9zfcx9CPz2zM3nPjHf11sig2Py53V7l8XTvl5Tb953qhPvWwXC
	 FXWNbUAvfbtSFjes2ivk1pByj25pSAKe2iTUk5hN8cZcOJH0gjLhm6K36rS38DG7zjbMK
	 ixAU13f0868fwVPDIRhUoTzfFC9gxjrJujm5j2utFHAzavn/66qyG1e68jO5DWmCHXsX5
	 8wnasPUe+ERrYzwOMeRqaoPdZPTmra3uEYnGbh1tjhs6O5SI5YF/J9P3Hi1j8v/IG3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CHBH4gV2;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AFF60A262E
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 18:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88AFF60A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CHBH4gV2
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e10a70540so638825f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 10:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595128; x=1795199928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WLYnDFB5WqiTmstQk3U+Or9EEun2Fd05KTvnYRhk7k=;
        b=CHBH4gV2txsfWUqt93sFXgZF7/fnwxzFiPXhIjbdrpO+4XbKSdWUmmbI02iSL+Tk+e
         UF85gafw1u4pnt2n+oWOHW0NRifB4bGa2JyalIt3gONDYehIkVUNWyhW25sSNIEg8wxP
         sAkNUnZ6tUcBdblyDmd8XmlrapYPS/rm3xFaCakAhnF4aMxC11Jp/WVWY7R6YhQxEexn
         Cg6ZpeVf+I2vgRaxVo1uOOjwJsjWWKQrG3/A7IF+sYtBNwKRJo6kAfHnrUlHscFjkzng
         nFC+2nLaO+x+uq4srb5SmH+UCT1OLiZWCBvTcsdqcIC+ElDcFyF4lfHOePqP3owY0SRC
         a6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595128; x=1795199928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WLYnDFB5WqiTmstQk3U+Or9EEun2Fd05KTvnYRhk7k=;
        b=jdPMOisgmQRMquN3sqZl12l9wzW9d0doYriKpMY1XivjyXfB3l//V4fichxUJsnRsl
         Gd9gTFVm3QzZACqVCIsOW12a3dPKgq38E44gHVSfyDec+kwDrnMIDS9Y6rf0Rrg2fdqZ
         5pNvB1iqRHq69vWUG46ai9cFeWi2XuqoIgxFFVm5Vtalc2m9dxy2SykGy8xqL8NOhGzZ
         OxjXuF24399AeJ/q3GszuBQ1l4upSovckZGW6GDYh+bRSBu9c1p5QfWoCmUgRfngWyL5
         80HH7Brat3kIqt0GNDfVUtO+fxqtgLwsbPPczZTJyLBXxu54PmH2k8YAGLy6ZJMAeaLQ
         kqxw==
X-Forwarded-Encrypted: i=1; AL+hErF/Aocd6VlzCEndyVfhU/37BfTdnoMG+jPuZY+VRNHSsmbiqASUBYL/Fj1hTCl3a5Q+NKznzc7zry8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+K1EbtlmAljimnUGKA8eH/hJE1AfgGBZLVFnDRTRTapsWQTHCa
	tDr0TAYrdL/m61j788dOPWJ6A6R4cMlwgsjLskNqVdSyL5qAHiwTcWHcvoOLSJXCy6M=
X-Gm-Gg: AYBFou2rpSuT5QmxvHGcwnZFI2bvhfQJUCeuaeUccK3IoIZU+Pt+xP4se0UvxyCkJ5O
	9Nh553Uy/2dfS8KI/iXfUK0w4BekJu2h1aVvUzUqMd1SN0csi2qNYjNuAxfZK+O7vA5R54U9NCj
	Ix8EfpcKsWVmRtao27kk5Ils1V+2xjUynQtWO2eGye4PYybs3LRCmtnz7FZdDGzoZRZwrS3oOHj
	1m/GfX1DFu+l3BRF+8SbPgcL8ljCLDaDpsH4OpM5/StMxUvfoZ0hSKXlKecG41HilNEO46x0fdQ
	bz3ZIoMVOluRE8WZfJ7IvGH4E86kmsU8EahUN7NDUoirUXe7bg4Z14sT65+kI3vqGFrTdKOS6NM
	NBOi9j225ZXWa8mqo/juzRvpjc1AZFZpd4BCzz2SJ4EkNMvW573XAqpSoaPkcepcUAVB6GT747W
	k9e59Waf14UJMieo92duFgQbuDH/dSuRJ9Pn0ZvsidJGxNX8KcvGMNB58i+xw6oMrvqiE/Rghyr
	O/Xz0MsbliHZuHmZudhxIuz+mRvH/zZHfz6q2W5K8HgJaVLCj6eioGkFALB+DdUr5tuEho084gc
	8ijT5UhqLjPgSJB0GcC+vJ2+9B+eWnQgiESWdsK5eAY=
X-Received: by 2002:a05:6000:1603:b0:492:7969:b4d2 with SMTP id ffacd0b85a97d-49c740bcf2cmr5166909f8f.40.1794595127796;
        Fri, 13 Nov 2026 10:38:47 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:46 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:24 +0100
Subject: [PATCH RFC 10/23] ASoC: qcom: lpass-cdc-dma: add support for WSA
 codec DMA
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
Message-Id: <20261113-topic-sm8650-el2-v1-10-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4605;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=mfCsPzRhTWREQ4uyFW4BU1EwrH1qQBPLGV1oO3W+KKo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kihi0qBfz+vwZ0bKz74N4nbztnTKEXa32JgaEV
 yPgRWB2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZIgAKCRB33NvayMhJ0TepEA
 DNjEhUfRPccxLAruIu2oedipL4Sdb17jQOcLzJtgLBDQh1lLv/z6fwv9MJHHWAQE3lDptHZlLcIzHT
 UL4aRFD7mi2lilpcnr9OxnwnsdaD+tZGvdNzQyHAxC17onvm5F59Xfu5Bg8HR4VMJP/2oiqDhEUYoS
 2Z4e2Jzaxp++5YkocnfcfPcGxXZ6dvjhId/UrTTGk97LU3+Srb9ywCYE4ud8ye8TYusgn/TPfQ++h2
 xdDm7tuGcdaKi8zSyb3oUl9hnRaynyBJ/scs1/86mxjHQDV4bTOCAsZc9ASAThWrfRkHtvEQNKNsaN
 YbqJWtekKzX6LXKdOOqEYc9Nwb45IRF33Vmt7xx46vXkeYhK3p+tPM6+0ZmozLg6Je78XuKMQpqLND
 CmvKLzgQEK/o3FuDQtCD8+nYKZe/tefKx6oBrCL5Y+oDUcJn3+ZqSi+xpcKp+3cQRlyK45pIA65+vJ
 fvqXTAN0dc17yqFdF4TF2XJTpQP6Sg7OZf08SKYgVx6OZCtn+RHUlHKp4I+dPtG2bXjmh8HzTP2C4b
 4+13Rlochxjj9WmVOy4ehCI4XVJOkrJpeHJTZ1p7p2271M6fkQbkX93d4d0qIpKGAM4KemRIvpIVFk
 KWSXoJhZdOrmN+E+mgN7UIM5MyFNuOQW4IHm95jPegpd3nkzmSFJk4IyHlUg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the plumbing for the WSA interface in the lpass codec
DMA driver.

The WSA interface uses the same LPM buffer as RXTX and
need to enable more LPM codec mem clocks.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cdc-dma.c | 44 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
index 2dc8c75c4bf0..903055e3188d 100644
--- a/sound/soc/qcom/lpass-cdc-dma.c
+++ b/sound/soc/qcom/lpass-cdc-dma.c
@@ -54,6 +54,14 @@ static void __lpass_get_dmactl_handle(struct snd_pcm_substream *substream, struc
 		*dmactl = drvdata->va_wr_dmactl;
 		*id = pcm_data->dma_ch - v->va_wrdma_channel_start;
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+		*dmactl = drvdata->wsa_rd_dmactl;
+		*id = pcm_data->dma_ch;
+		break;
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		*dmactl = drvdata->wsa_wr_dmactl;
+		*id = pcm_data->dma_ch - v->wsa_wrdma_channel_start;
+		break;
 	default:
 		dev_err(soc_runtime->dev, "invalid dai id for dma ctl: %d\n", dai_id);
 		break;
@@ -68,49 +76,67 @@ static int __lpass_get_codec_dma_intf_type(int dai_id)
 	case LPASS_CDC_DMA_RX0:
 	case LPASS_CDC_DMA_TX0:
 	case LPASS_CDC_DMA_VA_TX0:
+	case LPASS_CDC_DMA_WSA_TX0:
+	case LPASS_CDC_DMA_WSA_RX0:
 		ret = LPASS_CDC_DMA_INTERFACE1;
 		break;
 	case LPASS_CDC_DMA_RX1:
 	case LPASS_CDC_DMA_TX1:
 	case LPASS_CDC_DMA_VA_TX1:
+	case LPASS_CDC_DMA_WSA_RX1:
+	case LPASS_CDC_DMA_WSA_TX1:
 		ret = LPASS_CDC_DMA_INTERFACE2;
 		break;
 	case LPASS_CDC_DMA_RX2:
 	case LPASS_CDC_DMA_TX2:
 	case LPASS_CDC_DMA_VA_TX2:
+	case LPASS_CDC_DMA_WSA_RX2:
+	case LPASS_CDC_DMA_WSA_TX2:
 		ret = LPASS_CDC_DMA_INTERFACE3;
 		break;
 	case LPASS_CDC_DMA_RX3:
 	case LPASS_CDC_DMA_TX3:
 	case LPASS_CDC_DMA_VA_TX3:
+	case LPASS_CDC_DMA_WSA_RX3:
+	case LPASS_CDC_DMA_WSA_TX3:
 		ret = LPASS_CDC_DMA_INTERFACE4;
 		break;
 	case LPASS_CDC_DMA_RX4:
 	case LPASS_CDC_DMA_TX4:
 	case LPASS_CDC_DMA_VA_TX4:
+	case LPASS_CDC_DMA_WSA_RX4:
 		ret = LPASS_CDC_DMA_INTERFACE5;
 		break;
 	case LPASS_CDC_DMA_RX5:
 	case LPASS_CDC_DMA_TX5:
 	case LPASS_CDC_DMA_VA_TX5:
+	case LPASS_CDC_DMA_WSA_RX5:
+	case LPASS_CDC_DMA_WSA_TX5:
 		ret = LPASS_CDC_DMA_INTERFACE6;
 		break;
 	case LPASS_CDC_DMA_RX6:
 	case LPASS_CDC_DMA_TX6:
 	case LPASS_CDC_DMA_VA_TX6:
+	case LPASS_CDC_DMA_WSA_RX6:
+	case LPASS_CDC_DMA_WSA_TX6:
 		ret = LPASS_CDC_DMA_INTERFACE7;
 		break;
 	case LPASS_CDC_DMA_RX7:
 	case LPASS_CDC_DMA_TX7:
 	case LPASS_CDC_DMA_VA_TX7:
+	case LPASS_CDC_DMA_WSA_RX7:
+	case LPASS_CDC_DMA_WSA_TX7:
 		ret = LPASS_CDC_DMA_INTERFACE8;
 		break;
 	case LPASS_CDC_DMA_RX8:
 	case LPASS_CDC_DMA_TX8:
 	case LPASS_CDC_DMA_VA_TX8:
+	case LPASS_CDC_DMA_WSA_RX8:
+	case LPASS_CDC_DMA_WSA_TX8:
 		ret = LPASS_CDC_DMA_INTERFACE9;
 		break;
 	case LPASS_CDC_DMA_RX9:
+	case LPASS_CDC_DMA_WSA_RX9:
 		ret  = LPASS_CDC_DMA_INTERFACE10;
 		break;
 	default:
@@ -184,6 +210,17 @@ static int lpass_cdc_dma_daiops_startup(struct snd_pcm_substream *substream,
 		clk_set_rate(drvdata->va_mem0, CODEC_MEM_HZ_NORMAL);
 		clk_prepare_enable(drvdata->va_mem0);
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		clk_set_rate(drvdata->codec_mem0, CODEC_MEM_HZ_NORMAL);	//??
+		clk_set_rate(drvdata->codec_mem1, CODEC_MEM_HZ_NORMAL);	//??
+		clk_set_rate(drvdata->codec_mem2, CODEC_MEM_HZ_NORMAL);	//??
+		clk_set_rate(drvdata->codec_mem3, CODEC_MEM_HZ_NORMAL);	//??
+		clk_prepare_enable(drvdata->codec_mem0);		//??
+		clk_prepare_enable(drvdata->codec_mem1);		//??
+		clk_prepare_enable(drvdata->codec_mem2);		//??
+		clk_prepare_enable(drvdata->codec_mem3);		//??
+		break;
 	default:
 		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
 		break;
@@ -205,6 +242,13 @@ static void lpass_cdc_dma_daiops_shutdown(struct snd_pcm_substream *substream,
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
 		clk_disable_unprepare(drvdata->va_mem0);
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		clk_disable_unprepare(drvdata->codec_mem3);
+		clk_disable_unprepare(drvdata->codec_mem2);
+		clk_disable_unprepare(drvdata->codec_mem1);
+		clk_disable_unprepare(drvdata->codec_mem0);
+		break;
 	default:
 		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
 		break;

-- 
2.34.1

