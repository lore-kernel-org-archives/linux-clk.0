Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595126;
	b=xZFz06Eh5drErkUjWq9dv2ii67stBrE9QoT1bl0/EyYncR3iIswiNQjn5igcKmmUuOKj
	 /yA0mxPGywG2jTJl1QaLevwL7uVaRzZeER5wtcpky6ihHhNuQCjJ1K0NC2QWSuYomEXlQ
	 SHsCFvVNKWuheeYYrGeH/mTHUGW+T2z+VxRdTIcpHf4xQA8LH5TWkZWSUOwRm7KpGRIQS
	 cnygy+kmEf3m4cqW6LrqIy86Uht3zObb2z8ACsbSTkGiBd6cnTTSjwMFBNEbjbgBTfPe6
	 XMQ8yFZ3jXXH/bQOBpWCAwG34AMlJ6eyhcdYhei+G5nmJZjS+Kg0MrJUWI72gvQDsYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6Yb4xm/71FbPbrX8bul+Nh9djbt0T9PDaJg9F6V3s1Q=;
	b=tZj1nJFDWWQ5HY462aAyc9H2I8KC/vp1pup3XVhmCA5tdLRrdjBWiBpuL8qjuX0GopWl
	 gdD4u2HMX7+zhjvQ6aQLVCJK2mlvTSNcvSKWYy4nN9P4wNLOFnuPulWaGcHbQ6aI42kuV
	 5ohy3hw2AR7TZQzMs+eAdcEsM85g/f8hC4zIFIcPhdRlzhav2QdaQj0U85lxiP8pPR1yB
	 mwf5kruXhfXajuFUSjhJW9XoCCyepXazwRt3F3+xvA+E8pso3t09bLvMNO1SL1eQmy0un
	 DWlmQ/3VzEo8e+QsYt8l6P85GiMCgrtniGdA0tGVeAP8amogu/BKZoGtv9FYE/Ku8VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EMnFR12B;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CC1606E565
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 18:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7CC1606E565
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EMnFR12B
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b467581b98so10633565e9.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 10:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595124; x=1795199924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Yb4xm/71FbPbrX8bul+Nh9djbt0T9PDaJg9F6V3s1Q=;
        b=EMnFR12BFy/Zd/JfaqoThARSiDLJF50Y55g/A5oqz/RdNk/+AyHud5tlPSeLcaJY7E
         w7kfG9fjnI+eT86YE6YxbUMWWML14o5beIvMc/Ro6ndCwjooH0cV+KD7EloGy/wRJD9V
         Jif90NVzZVcQ6+YoLmHHZt4iAeZLaEA7ly68CU49G7X3pzaWIZR8lMzP2+vY891L1jTl
         h8RmgqDHq6vxU266MaErJnLthW6M6kNZv5ZuJ3s2+KVNORgMp4D4JrCArmECEFJMES0C
         4OFjKe4uqE0XjwMT4xmKxa49UaDBJ5eRE3nw5DHCUehtiWFP+2bUX4YlOMp59d2pT66y
         2umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595124; x=1795199924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Yb4xm/71FbPbrX8bul+Nh9djbt0T9PDaJg9F6V3s1Q=;
        b=ShD2ou6tIyqIYB2apbp3VKuahjR90zlRs8zA3l5GPXUV6QsMU4qULPHiOvmOyzOGcN
         R+d6ll7rvnHL1fZeSum8/m8jgVYopmvpDCRYeRGvU2r+Bs92JvSh47PHd4PkWcC5L0kt
         KjEWOzXONYf5Nm5Odja01T1ar2j58fcGmIqr7KI2YjNlke8nuCXzLWf1MiT3nn5/k1Dz
         +QX18rsTX2xd1diHgRrva861ZDHHuWUBt127E0JFr9BwUMxbb82AfmMw1V9A361BId4i
         0V9xaIkbTXn0R28OaUoNho1TF2qatgTA74nLkmCK7N+igoTFBDR3Ec3yNAvDfoSeW30W
         CORQ==
X-Forwarded-Encrypted: i=1; AL+hErGkQ+mrlqlNZtB+x2tR6KKYCP+ejTNYc8/2IsGX/L7ybvFSnW0jKI7bGKdVwe6vukKA3ZvUyFuChL4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7smLz0Vt8SSiWrBcU1f1Gy1JIRp87BW+4PqcqbyeQo9Y9+NTm
	wENriOI9FaLf4TsPRf8q2gitFaSIPo0Y3XXQuxUzg060Jn8WhvDTB6o7XJSQ/wLM/hA=
X-Gm-Gg: AYBFou2rujcY6I3dQeIyqvFSfRDrXnb+Pquu7pcaST3osVfCj7myzmLNei/wnCRHxgA
	UKhgbRlb70eWgj5WtzAP0lCPzRI/yYTOYLQadfcskWQkIWMZO1QVQXH8f/a0cLeWq9g0vss49z4
	1bLQqbIo/GrmYIphxCljeHZ52ojTf/W3jA9lv7jkTGqdBqrN0do6qUaxmvJF2N/mUJi+zRYo4b/
	5Xc1Mo8wr5xhLWOK6g91oBxlNqXhL9KP/bBAVXlq0g4xh8TfgyPJ1jkznvlhODW/WOq8mTEeLlB
	9tsK8SZdN9h3HPO3WPqEUyQ6Q/YyKUwkJ2PiRMbbP2Xobj2zVeKjeutSiiZjrKRRaO+DHvMDn1z
	bbm+qEZafJ+DFVWefQWS6VNj6CxJtZPu1r7/4quPQSgX9JwWc0dBpYHp5YlG5/3szhdCXeR69Le
	BlRbHzl72AFaVJIpG13RFF/7836jdILBDvL61SYRbS/9tpMi8Dir2qZ+q95zxXfvH9ynHOHp9Re
	k6RcuIG3vWkujPn0cJNhCinIMlicvWbOmqKU+giuWYxm8UiVOqhdSc1plBIjZNonOKQKtNhL7tE
	HjwIxPvmdO+7zqsd0cXVLVszEzcffgsk6bDLQ7GHJDc=
X-Received: by 2002:a05:600c:46cb:b0:4bb:52d8:73ef with SMTP id 5b1f17b1804b1-4bb55af12e1mr70215745e9.34.1794595124200;
        Fri, 13 Nov 2026 10:38:44 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:22 +0100
Subject: [PATCH RFC 08/23] ASoC: qcom: lpass-cpu: get the optional
 codec_mem3 clock
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
Message-Id: <20261113-topic-sm8650-el2-v1-8-5183f6aab9fc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1381;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Z8GunUt92Y/75liBMYWXLbRwhUaetuFUQPX3BHF04L4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91khB1slVEF7d6pDan68qfrqHRNn8kCup/oD7Ah9
 hZllBjaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZIQAKCRB33NvayMhJ0ezgD/
 45ZUV+oN3bZPvX/nBQqaRAOlnpXXntUnO4puAR6WYjREGQL+qQR3swBxSOfZuApkJ1uP+MRJNBBNWH
 lQUfzGyz359aiHXu2wQg8ejOYBhu/RCprmvNTWoOo6iEDUMhAJmcNC4vwAEeRd7hGRetUUBwaGGqBA
 2MX2bvLNk3hnBttn2U2wB73UDvIPTZMix5+hOCKn77M0TkzxygA+QtythciBB1bz1ZjHEH41fvW+Rf
 v4MG5fa7fkHO1dHDssw545R581/ncL7jEv6i5LOxYu62gpgGRI1fWZgmuiEnwKy+pog0m5sZjoRbQN
 o8tMtxZkvHdS3h5KUsa/p7DzS23yZ6FPyU4u0ya+hkxanDIaN6wQFjUGrB5ogFsGkRZwjMcWK9rVVL
 4c2U/VMSdxVz6s1vTO1waKQ+tG3fi/VRMkvszXcMofbGuOvkBtr3ffl9t9zVFZkhjaknEnYsWCY+vU
 lbgz1EwV50TtXULVzqxt3dixNV8Erf4Vgpc6PpQAjSw3HPR9dCLnxPiY79MrST0s2x9lHkxxNp/FpJ
 rzpuEfpz5ApeS3oHmoslrpuTh3ZLh05TE+uXj9hmI0pBtWAgkwhegWpjmHGHPtocAGh+XpHkYwZRaC
 9UZyDMFeqzoYTidcj7aC+O+w2zdxRw0yEtyrOah3BGzW3mwqecX3Py6Mn1Ag==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Some SoCs like SM8650 have a 4th codec LPM block, gated by its own
codec_mem3 clock, which the driver doesn't get.

Get the optional audio_cc_codec_mem3 clock with the other codec DMA clocks.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c | 4 ++++
 sound/soc/qcom/lpass.h     | 1 +
 2 files changed, 5 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index ee187eeb7392..ea8b6083529c 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1071,6 +1071,10 @@ static int of_lpass_cdc_dma_clks_parse(struct device *dev,
 	if (IS_ERR(data->codec_mem2))
 		return PTR_ERR(data->codec_mem2);
 
+	data->codec_mem3 = devm_clk_get_optional(dev, "audio_cc_codec_mem3");
+	if (IS_ERR(data->codec_mem3))
+		return PTR_ERR(data->codec_mem3);
+
 	data->va_mem0 = devm_clk_get(dev, "aon_cc_va_mem0");
 	if (IS_ERR(data->va_mem0))
 		return PTR_ERR(data->va_mem0);
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 68b71039b981..4231466928d4 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -107,6 +107,7 @@ struct lpass_data {
 	struct clk *codec_mem0;
 	struct clk *codec_mem1;
 	struct clk *codec_mem2;
+	struct clk *codec_mem3;
 	struct clk *va_mem0;
 
 	/* MI2S SD lines to use for playback/capture */

-- 
2.34.1

