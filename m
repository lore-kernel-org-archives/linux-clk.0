Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D88723BD06
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 13:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569454; cv=none; b=OKVG8FDvnM+AWSrmKh401VwB5+BX7iqtNDoL4BZMGoAKwnK67WMvYPJsDZR7s0q4JTfOx4SSt/SMdbC2fZV5CjBNniXHEjBNEf83WJFc7dv0X/OLMhJYmVk+h6UWoPf5nf6EYpQYEodV7Rh/oCedyPnZMKu8IsQ/gHFbVzjbm/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569454; c=relaxed/simple;
	bh=v3yWlx3GbotL3G9AhcSN50C5SpvFDf2A//QxTjb64Xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fna8gZgRUrWimbu3P51cVRHyHJsgRmEuMRw904G2bW6seKm45E5MKdKvPwJmFcLZjIVprmNkV5ziNyXBgCcrFEd1GCD8wwbzsoQqyeila6rl5dKZ+hDVjYBqpAuK+rMCDK8YdLMzpPEY48VEtw9mDsTiJgvCmGiTjF9aPyTx7So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=be3WEBYL; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="be3WEBYL"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b879d5c1526so117459366b.1
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 05:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768569448; x=1769174248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJgg01NaZF2IVCPUnfeyk7TRyWFsft/f+OKB8cHgBK8=;
        b=be3WEBYLr9CQ8Uqbqh/EA5zPkEV/7hU5Jz3ypwBG0e9aSBTlqKJGbZ4u4eWPet+gdh
         shzQnn5Q5FFynUD5mizZ7QvHkgU5ruktjLctez4uCwUsh4lE5xMadbBfH348kl9chRI3
         kx6GZ7w9ubrHP+JQU7yTFZn6QZt3+7vYNiNzqyXt5op3rQ/mREwzSfZscPSCw7B916i/
         OljF6Tp8xDVIkbB3rWb6joPQ8Zv++tBZnhHVYc4xvzqCX5yO0fhZW0UYEVdu8YQyJg1z
         y8AzmtxG59iorijbkrEQYsppYqhv0InXGN8vJ1W4JJ+eIdcNCxULdk+LCSGs4KVugme/
         Pr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768569448; x=1769174248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gJgg01NaZF2IVCPUnfeyk7TRyWFsft/f+OKB8cHgBK8=;
        b=pbjV89PREl6jGJ94yOGfW3y+dUmv6nvcbix2IFSFVCIo9pFKLw0yhtIzB7qjnEi4pq
         flxxn5NUbfCcYAhzqZsaQ3/ped96qq9BU3q++4ay2XdIgK/2Dlq3vnoXXd8XTIiLwDkj
         NjAqERXr3zWDXlbjl/xGrnu3EDsURWqmDQ5Jf4/AL1KlxP7Th/2oIEubTh4N3iRCJkFi
         YlVSV4I2uOCG+wMCaF2cpbd4RoT9PURHegjBftU6yxYq4TKL57p8s+v5z+gykqhhO4Os
         cg8RPNzSX1cTN00114x2YK+0D5lUkTpIPagNDyvZPA81XYQcaqYcBLxfwDXtXyKIiHCK
         iJWw==
X-Forwarded-Encrypted: i=1; AJvYcCUMc48jophQ7Gd0Z3oWilmBj9Fcp7ASerbxmMAZZSPGZNH7d84IjwlA9nlgRsrtlYY+UmN1djeSN6E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5vSb5CpTJsg2vX7egaecRGU0Gga25VZPquc7+IpoPrMPdI46b
	YeCKZSxdaGjPqDjbebxAH+Mya/m0pe3BRY4iDlYlReetyD23u+pitMny/E9G/BIelVQ=
X-Gm-Gg: AY/fxX7OrwappSI/G3nW49EDc/BoNuH662Ni9o7WB3TQKMlxO2iP5841H9OVyqIGE9v
	+oM4o8sOnIhWyo0QoaGevHjRvUjp6eKFEIeb8pWBwTtd3GuxS0s4Z037PHq5n8rco+Ar6zWKDQF
	SLL5z55ZYTNR7YtxnspUE9GT1dY7vHfK5QhpNCaf00froTlJ2Anx+DjOHkiMCM9uYiJKpuRvrdP
	RH/P5xRUNANCk6fahmW/nv7+CahKi5gFtQaEPZ00+SXpEra69ICU3DtgKGJFtgqfJGAmfw0Q0wD
	DtJP7Lc/VG43EXINRv6ZF6GmMZSjIi8WduAO1eXsyRWrDJVKFPq0qBvWRNlq9u4T1BZ2dnLtoKh
	rhBT7jThKSszw4FxHmUajPEd5XfctxubwzSD0shw0lUZEnsZHsUYjINn4yUbLhZOWN+pwQ8QLp5
	6ozxpUaWlhOOD2VKAlJzS4xL7GlHNWaSMwcDD4/rIlzRrCE6PoJjeA4GtRlxQyvb3J
X-Received: by 2002:a17:907:940d:b0:b87:2d0f:d42c with SMTP id a640c23a62f3a-b8796bf55e7mr207695866b.63.1768569448338;
        Fri, 16 Jan 2026 05:17:28 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a350dbsm235507366b.69.2026.01.16.05.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:17:27 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 14:17:24 +0100
Subject: [PATCH 5/5] arm64: dts: qcom: milos: Add interconnects to camcc
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-camcc-icc-v1-5-400b7fcd156a@fairphone.com>
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
In-Reply-To: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768569443; l=934;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=v3yWlx3GbotL3G9AhcSN50C5SpvFDf2A//QxTjb64Xs=;
 b=7wylF7yqR/1GoCG7yFRPMLqJokhikSOBv5u57rvVqHFkqjHgqmzQMvlpMhfx0Dl0hM+wLd8sL
 nNihUzL6AQiDwGvEwHERwtwD5doSABLP66k8esCiKpq1FwIUTJhh9H+
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The CAMSS_TOP_GDSC inside camcc requires an interconnect path to be
enabled, otherwise the GDSC will be stuck on 'off' and can't be enabled.

Add the interconnect path so that this requirement can be satisfied by
the kernel.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 0f69deabb60c..58b4c2966df1 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1660,6 +1660,9 @@ camcc: clock-controller@adb0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_CAMERA_AHB_CLK>;
 
+			interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.52.0

