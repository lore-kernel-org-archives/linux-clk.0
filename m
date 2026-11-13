Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595144;
	b=5nq9jSgk+Ay3+oazsin/R8tzUh2AdbdOUydpW/y67O4yEN8nLkGpVK6CaPNM1Hd9GUUK
	 C05S1Z/jrRDAeLLaTW0HyLo5hnyD47piFAEqkUGS4l5R6lguwLM0XWKQv8TUv6Ok6NYsh
	 BrnZ6C4DMse3VSLDOB12fuUo7XenPJ+wg3lGnGVuFcwwNDmlhtyOXo289rslz01HFMoog
	 zh7H+c3vkH4SeBzL/5lSQpDYWZVoWdSMRJ5pf9X4qVKpwdREAkN7TlHjx7XpuhE9IqSj4
	 u5bfDgVugk9QWR6zXc4vzPrk2mebqSusz8iv5A7whwsyUTiQdoNm2vC5SczBVv4HQmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DAHAq1IsJ7ZslE3LGkImlwaGBe5PjhDrRKVBIfWw+vw=;
	b=a7NQCNwmIHfATmn6qra9+tc67uHU6saMnFE7lktY3LtmfyFTmExYmgs3ZLnbhSVRwurj
	 ki5FqtyTBnuanA4fJBLbtcH/m7VMCCNK2URSO8muhM3V4VqOd3g4/q8WVWht4eP14W1na
	 IHD5aRWjgSznIxQpTH8zE6ddFfE4ymWR77gJ3Qc04xaglg905/35bAwQfxn8GwdSZqtDT
	 Tm5YF3yuNFWfH+ZMXC0RVjNSSlJSfC8KJ9LE1+EOZRVg542ZGatfUULH/eK1Tl9BzDD26
	 XsX+g/T3JNh9+rSHoI/FPNHnOyeRCi3K4B7X7eGsVq/SC13sGc5flnRZQYEcKNWvnyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PHOkcPW+;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CDE60787EB
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 18:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62CDE60787EB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PHOkcPW+
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1260491f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 10:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595143; x=1795199943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DAHAq1IsJ7ZslE3LGkImlwaGBe5PjhDrRKVBIfWw+vw=;
        b=PHOkcPW+PAWPCSsGV8WrL7VmLRK1hUSLoOrv7sGnoY8W1UJWtOT8figiBTJFuJhkUq
         RHI0iH3Q6i08V2EcS74axfEZ+Cq0j+8y9Fmy06OkeRqeCGLsv0eiIBsvhl2qufsdBREz
         oq7j4p/lPogKbm5glbHznGcQX8rCIEQf+1yJ8PI2s/+D3TnQdvWN1ERB3mG3Wz1huvrq
         y2tATk0IzBEEFTGIQKnssOD3yggXQ91RR1E1tzI0VgExCvUz4bEEgit8iQ3R4ChjGqJs
         yr7g1nQdi+bJs+40929504rGGJ1RxNH72VkPxPXGxA+IwfoCGfBhgQNKiJvZ2eYm4zD3
         lyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595143; x=1795199943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DAHAq1IsJ7ZslE3LGkImlwaGBe5PjhDrRKVBIfWw+vw=;
        b=PfOfP1hZ3UImacjnU+Gg3SiedKYQso9fNinXvMUESajOQ6fkPeYZHduXZf2/Ai/uqT
         TLPQnT/PJoP7UrhPfzWgz4iZkp6amEFExt9MzF8PNJcK3Z06hN9glDIhR8oyguO1Uh7G
         IF5jhSxrClspOvlZQHRjE7EmJZs++kFCrDYQL4m5KUQNZmKL+KbeplrTLXggpLPvZzo3
         40BQrCvRK+cWo/wICXSEHmZOEV3wDmzCWY0ceDH4hZ+tBKdCT3jJ5BPPsVF9ozB+dnPX
         LmVXw28+FQxl29J0dKOalR7KrKFUirPIW5n6NJbAAFIEJEhYp47U7QE6bsm4D46kD0J9
         dg4Q==
X-Forwarded-Encrypted: i=1; AL+hErEChl4AL3FYBV48WVUUsPNo/sYaIXcrmcI6RCNJq8wlrXEWBBrW3Mgy991G2YVFFgC6ws3pILH31Z4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QCmN+RcqRqCz28FgxS+lHHeKoV6M/XxY/iEMek7psKyOxbxWV
	m8rFUpEMyCyRtJQ+11V1XYFiY6wfiBd/En/ZTeT/evkcGPWdycPmD+IrfxPxPCf8QAY=
X-Gm-Gg: AYBFou21LCEgbKNclJA6s8Wfn5Eg/rcKNBm4jGp0IXBf+Qyol6GRRjRcWjBVt3taPp7
	c+H+ubdLqAsV4d+k5rxwvUFN8kuO/VJuz3ZAJh2SvYDNF9zZb1aNoM5ioFQUO6JEOpl0aOO+XR0
	1/BAIVT6y0aMIsZLGEV4dr8D7zipKXgBOnuY3S0YznB5aUKs7h9RTgDuW6Dzd98S22nydse1dEj
	dzg03nf1o4FSm45R21qlOmBHcq6JqYex0paf8OFjMz+hqA2avqutrlsvcG0EMYQECI+nd4mLp+y
	mXCBJEl6X0lfonycHVu0B8EBpK+xBe44vPKVa5nIpcQA2ybO/oi3DqsdhOg9MEL1KuWaZ/lUHle
	OYzWSt1xM1FDskzqTnSdOOi5w9v/f7oq+zrZTaieadO1OiBHYehCoQkaLHPzEBlJYdzDK+oLzvy
	FsQXi1sf3LP8B4+R12y+DL4h3XekG2eMGOW2VMIXhqrISrP19a6+HQTgLhbpKzDI1V2dVbWoIJD
	xmTYVE/wCyMdQg+CgDNm5bG8Fwxwctxtw1S6pkvapa8fU8vfBMoC85hnbLZA0+fW43FBcOAI6HI
	DAsAcVyk7CAKT+Mc2b01OqDzqQAOsF1IiXQIlO5fJnU=
X-Received: by 2002:a05:6000:290c:b0:493:a59d:880e with SMTP id ffacd0b85a97d-49c713add85mr7018623f8f.30.1794595142585;
        Fri, 13 Nov 2026 10:39:02 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:39:02 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:37 +0100
Subject: [PATCH RFC 23/23] arm64: defconfig: enable the SM8650 LPASS CPU
 driver
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
Message-Id: <20261113-topic-sm8650-el2-v1-23-5183f6aab9fc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=736;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TuP0ZUisg9EWjSIcUm86e7zEnoMVli/g8vNCUSlRTgs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kpXiEkv6/Vb4mssFp0ghv3S+SXNBFifU6hH4nI
 NXpSg8KJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZKQAKCRB33NvayMhJ0RxrD/
 9VWK4iP0Ou0qF42iPGPcogEvqT+dCtX04UEO3IIJMgaC6ibnCYdgfJ7lQuSGBEjK56j0ayXnneD9T8
 zDg3QYSTO/7vQ98uMZqODrksixRlNB0OCNM7IBHrHvU54JhJ+jueQ0APXrqTVSn6ide4liKpYgR73R
 R+zhLFhsNR5mJ7UrymGr1R8hxYkI5PKqIJAiOJxp7Wy/xkKlWiqvcx0pXQgh0WVxBpEjnzQMNSQUFb
 7bzLIBpv4Z8RH6ORYZclZ6cI8vvpKa3nQEV/smFAoNF49vibmMduja8MxLLbFFY1kdYSnuoETR0GCC
 +2pPh3t3fJ4zFmos16MjmoHh9zlzxZ3pJiOx+VukD6/ZJFnUnqdvW+fyqLe/mWLv6RfsF8k9xun/aP
 q/LiU1yZbgPCYjLGh9n/ctTLsXctEWHj6tklTsnpa3YW4fGTyyDk02MDJSyDaMh7kzuDNY28Ds/Mju
 +4ZEm2EolI+WYfyeTRh0VGx2efXRDXIsvmANBlze28SouA7zCokJbpKHQWVhDYlzK8+xrSxHHvhuLT
 Do4zFI0TA5TFPNxTiYcfUh8WX6SmKFM7eMv4e59PcGkPqv617rst7kwLcPlANrMvJ7UeoxBSP03qFz
 GGSdZ8Wt0EEXHSLVZCeGpFTAR1t3ic4Ja9sSzzwZ6FpbmWMaim1lLb8l5IRw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Boards like the Valve Deckard drive the SM8650 audio interfaces from Linux.

Enable the SM8650 LPASS CPU driver as a module.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..a2dc062f5b33 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1116,6 +1116,7 @@ CONFIG_SND_SOC_MT8365_MT6357=m
 CONFIG_SND_MESON_AXG_SOUND_CARD=m
 CONFIG_SND_MESON_GX_SOUND_CARD=m
 CONFIG_SND_SOC_QCOM=m
+CONFIG_SND_SOC_LPASS_SM8650=m
 CONFIG_SND_SOC_APQ8016_SBC=m
 CONFIG_SND_SOC_QDSP6_USB=m
 CONFIG_SND_SOC_MSM8996=m

-- 
2.34.1

