Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD181BF38
	for <linux-clk@vger.kernel.org>; Thu, 25 Jan 2024 09:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706174885; cv=none; b=IUEEUlf5gOIM0Zyt2Yx63P7lUHqfX+cqpUt0aKUxKDvpqYH0uiX5Vzpf44WxfmDlK5Cjz596zYqNof0ydFJocFrtI7ipR8pviriSAgD/RRh6e7M3eBo4G9y3JQDwf0KSeoIVdwTIDx6DAr4ZgJmeiS9sLS8iq/74vpkq+rbMCAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706174885; c=relaxed/simple;
	bh=gy0zUIMX0ecGhpvp4QAVUCRKbXWcUlLlLRZf94hkeOk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QLJxbWZ3eqK3dctUirteqPHWRuFMzaYHFOfMj/w/5kqvjhRW5oLDs2YZTLMcrG4fbifgBEQn+H8XzhnqlWL9APNHIgQUQ8jfyIRe31YgnL2yAC0Qz/G1ItV3zlr4gvKsGMvr4T7g8LLBzX3efQDkghs4E03XMiW7YC2HfuV0KHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x6+4eyLj; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x6+4eyLj"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-55a356f8440so7701461a12.2
        for <linux-clk@vger.kernel.org>; Thu, 25 Jan 2024 01:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706174882; x=1706779682; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KH02RcuM2+v9UWcFG0xYMqcwTW43qilDo47iIK70Yx8=;
        b=x6+4eyLjhocUR6N46/NzRVdBcljV/rOLTyeoqjqYvfI9U83Cha43z7H3aAi/aTAm2O
         uxin+Ph/c3HnIwiPvvF4Z2VOhztASGo2JjpW3GJOwl4obtmM3xpQUod2l6rOMh7RVwNe
         M3GZCDLwBh0e7OXN9G39tNrohVDac4grOnp+caS/KIybVzmOOPtfL3YWquQXdebrQYd8
         2A4imYpqPaZNHdFjEgZ/CByvqDsRnCqF1wQgUis2QdEHIxIPi55tvCXbAkG2B9adDVKc
         rLh2sL4TPp8p2prdiBXwGdPbHHlXYgMuY47Dg9wbLQRu6AeMIVOpFHmb3uZ2Cnbj24bB
         WmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706174882; x=1706779682;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KH02RcuM2+v9UWcFG0xYMqcwTW43qilDo47iIK70Yx8=;
        b=Haini8z953zPMbPcTNuP3CRemV2G+wn2Q2W5E4QeSFhjK/9x3xjWX17xfcP/oCiPFE
         jr53k812qqJelr4/ny4kXPzTOHRJTTxOQU9t+EzGT/caGFDT6PthxiDY0a2SOj4sZi/z
         yuzxDnskkfkJoxkH1jRjI+T/AKGOXTdFDiIcaLV0G6CXhkFLDd+wqQWme4giabY2LvtO
         dbJW93+NXNKml/2p984YNsL/EatRoyeXCsb87optJZ7ZKL11DhIL0ZF9PHC2GsOx50W2
         G/9RZNkonruGBUf7Ux+9jA5mprpat72fmrn8rLi0Q5BiaW68557UEkVsDHTsJ031bALd
         VS0g==
X-Gm-Message-State: AOJu0YxRegaZjU15TORwVBUr7qFG9z/7vHm98IGi1l7c3gCqG5knX4nY
	yj0N7mcavo+6LR6C/+FPF2U644pcZKTPt3eDWmqQroin3AUWPwYMub6oeT3ZEvU=
X-Google-Smtp-Source: AGHT+IGrcysk+o5meGm3pKRBCvTlh9267epGM9XB2KmgkiZ9t0IIWFs273iprtH1A0sD/YdIt6gDAg==
X-Received: by 2002:aa7:da8e:0:b0:55c:7dbe:2c47 with SMTP id q14-20020aa7da8e000000b0055c7dbe2c47mr35179eds.29.1706174881745;
        Thu, 25 Jan 2024 01:28:01 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id f19-20020a056402005300b00554af5ec62asm17356391edu.8.2024.01.25.01.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 01:28:01 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 0/5] clk: qcom: sm8[56]50: Drop the Disp AHB clock from
 Display Clock Controller
Date: Thu, 25 Jan 2024 11:27:44 +0200
Message-Id: <20240125-dispcc-sm8550-sm8650-drop-disp-ahb-clk-v1-0-0f8d96156156@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJApsmUC/x2NywqDMBBFf0Vm7UASTFv9FXERk0kd6iNkoBSC/
 27q6nC4cG4BocwkMDQFMn1Z+Nir6LYBv7j9TcihOhhlOqWNxcCSvEfZXtaqPx4VIR/pXtAtM/r
 1g9EpreNzpj46qLGUKfLvPhqn87wA7N0rq3gAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1190; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=gy0zUIMX0ecGhpvp4QAVUCRKbXWcUlLlLRZf94hkeOk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlsimVIXDYDCtv1pTKnIrt9mks0y3gW2UWjifWu
 VCieoCzUouJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbIplQAKCRAbX0TJAJUV
 VtvAD/wPCohABL7H3uUrA8gJ+cgaA1bMLZB+k3KUurpKJmMm6vO9Uy1h/rQTDsIN19EvrgoOETz
 TBCtU4zH7jRCPTy+CBUR0Zb6/rzvZA47l/TxiG2Vy2RyPRvrPyohlcGWMmN8GEGIrn3TRUhcnoT
 qKtD6TdZqmzeCwoH8PsuezyTiUe8l4mJOUTDv/r4GxvXJb1itQXz669HlF3zjZ6a3YFZ+nGKczi
 sXRIVDuZFlnSKRSNKH4e2ru7GZi2vAk4d2nWQbRwHMow+iHVC7LY08yGnMrFAza0fc6D8yvGhCn
 T1EPSohGOJ42PFnRKeLC5eKMDZRhT5iZN+wwbUMZaAFhrzrl0tuHpgjgBjwQkHnZ2JfeDwiG350
 n7Dkdjqc8PABVewqRNHIkKd7BHiLtoR+dhWarZd3PYiEi1BMIG7w+w+x4YU+ixM4M/TNrvV/atV
 /BdWEX/OY4f/SDxKIsD/4jGjBAADoS57s0KD5z4d5sYV8YIEJw+MZaJs9QCA7KpCL2RPUnIYgJa
 aiAUUikBZiDlQhN/wYj0v3YF7Sh44P83PspafVewi2G6ZriQ1Ozf1Ym3QgZjqS2KFAAvUBwvYb3
 Pz5/S4F8ffTC+iLnhBuq44lcJHT43Ox3R8rkG3ncsYsDFQUu3xmn6UWGFQeeygalg4bNyNJhBcj
 6RnMzW0Z1c2aoRg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Disp AHB clock is provided by the GCC but never registered. It is
instead enabled on probe as it is expected to be always-on. So it should
be dropped from Disp CC entirely.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (5):
      dt-bindings: clock: sm8550-dispcc: Drop the Disp AHB clock
      arm64: dts: qcom: sm8550: Drop the Disp AHB clock from dispcc node
      arm64: dts: qcom: sm8650: Drop the Disp AHB clock from dispcc node
      clk: qcom: dispcc-sm8550: Drop the Disp AHB DT provided clock
      clk: qcom: dispcc-sm8650: Drop the Disp AHB DT provided clock

 Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml | 2 --
 arch/arm64/boot/dts/qcom/sm8550.dtsi                            | 1 -
 arch/arm64/boot/dts/qcom/sm8650.dtsi                            | 1 -
 drivers/clk/qcom/dispcc-sm8550.c                                | 1 -
 drivers/clk/qcom/dispcc-sm8650.c                                | 1 -
 5 files changed, 6 deletions(-)
---
base-commit: 01af33cc9894b4489fb68fa35c40e9fe85df63dc
change-id: 20240125-dispcc-sm8550-sm8650-drop-disp-ahb-clk-fa011f7be9fa

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

