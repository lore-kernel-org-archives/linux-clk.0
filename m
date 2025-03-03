Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88BF21507B
	for <linux-clk@vger.kernel.org>; Mon,  3 Mar 2025 22:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741041586; cv=none; b=ICEW7jUBR6QIOQo79X7vLuIlm44Au/GR8+2LWUQJi7dW8lTA0LXliB/Mq9qhmhjfj4a9SmYJ+u3JdT9yi1+WXfmVNTAq4cWmb3sCGAGqJyJc/X0jKWOxCyllD3E1ELCGyI/Z1BZgvPHt+LZM3Pk3WZZzVczHffMaEsuFVBtF87o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741041586; c=relaxed/simple;
	bh=F2BPRhnYI4/oT4PuPb232wQyV65ROpE/B2Cw23k2FBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tqThpTfRP+DaGzHu9ifm5fcq2L8EzuosYGB6Jm6dU6ESpf/iQrrHQw8EVA+r0djTyhx7aDCt92DmbGTvSg4qXW94Z71qwWDXuxiDmD2EMs8NpkeLXn1f+B4XiAu0GOkCRPgNp223WOHSE6d1PIoAFsgYTR4vJUs81U7BXpoqy+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bjQyC9Rd; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bjQyC9Rd"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-549578af093so547196e87.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Mar 2025 14:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741041583; x=1741646383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lU0Ty4Rv1+MR/rM5LdY8GrZthMLsgmGzQN5S3dlbH40=;
        b=bjQyC9RdSxyoL04+I/uKZLIr9CF8mbi/W931SFEwHf4FGbH/rmvQzw32Z69Oir6GGQ
         q1qgi08vN9uw+h/nDeLDeWNVFs276UXCZ2/RRv87Xbn/2Z41u0exrTRDmfBIaHFcS4GB
         dokNIMQzwBwyO5S8glAdfHwoqvJbrnJuUnLeBrCIZp94tA8wKp8eDa6LEvH4x/TbGyN9
         qG8UAjKx3lpBmEnEsqI+5Zz9evSbZPH32qbjJ3ZWEeT9J758nGnm6fbuHZnDgxAuTmWK
         CrRe/53s403fe2N5UY1JDtOqddC0gjEvJBUAMuugy76+J7HStsh8G/kv3zFakmjcr9+/
         RPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741041583; x=1741646383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lU0Ty4Rv1+MR/rM5LdY8GrZthMLsgmGzQN5S3dlbH40=;
        b=Ygqgf3pizv3kGYKItRlLWlR4gjf2Yxie3cjmOw4qohwjXi+BwtlaiDVJLgDYBvyy2T
         lNCwll73kz8xNOBJHex/YBUvKMtSXDh5C5ojmxQROCbMEgBvc7KwKLABr3mZEdQZROmj
         NBZzxoA95ZlVurQsEtTzU1eaCvVSz9WFQDkAv2C0KkvhPh1IYgKc2CK0my6S8X8AYdWo
         3rQXUy53TswKP0b1jBJr+nKMr10uD2rRh2KFoIUJNMl1Xdc/UVOxo4e+1u3q2yLd3dON
         uGrTB8uWwotE9JCsrK0EKIS3JyiXy1w+rJbr5bQMwa0Fb/2OyKB+k24gT4Wd7X9jEHP9
         zLzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0SwQSGJDpnnEwnRJMBBpiVlyql4jTlL5zbIzQQc+Fk6VaAiPRMtYV5wH9ds+HxEhFmcGboC+5SCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YycbbG6JVmFv2adz1Sk+O1+51fFNE834IavDrEF7SBxoM0wSqhh
	0Ox84nHG5l280ptBzOgPTSMBa0WDNLgt8XvWyNq9mAVkoImgFVnOTmh8taN74c0=
X-Gm-Gg: ASbGncuLZbO4o1B4OclDqyU+TdDHhHEsslE4JIPgb4C6fNAqhWNyeIhDNpam2JGlQn0
	CRm3VHpZFMY1/BPyTCzoCGzWBmigqqHwZzhg9u5r/bfh0ZM5rsGiya/lqf6GwWhyskhVtZzTfwe
	bJmKDgQKOs+wE8QxLzgrpm7JB3gJxrowhFsORj7Ixp5hUcGiYvISLHRuPS+cSMMZJ9pzNqjgy5x
	haWozDKY1+N7hkg6NF5xa1Je/oKJXbJcGTd3c7CJ7BjLghjPLvzLLS7apmpBl1U6Iu9Ze6n8Ykg
	VjnpMyAaZ5SqRRejox7OK5xQbgzT273n1T/OKsnSlU7YEIFp12A8Hf8C7VNoOO2ujVBR+84gKUp
	FJSyWPAyNKvLR5zTMjNAltgHQd6mNgHTLxA==
X-Google-Smtp-Source: AGHT+IEoOUau6O8fOgldkkrcY4yXopOzPJmbwXvQjDy3D2WrJL1U4OpUpUuUU0DL/6OV3m1+vwjrdQ==
X-Received: by 2002:a05:6512:2383:b0:545:2338:f5f8 with SMTP id 2adb3069b0e04-549763c219amr41679e87.6.1741041582737;
        Mon, 03 Mar 2025 14:39:42 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54950e2d386sm1106706e87.17.2025.03.03.14.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:39:41 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: qcom: sm8450-camcc: Remove qcom,x1e80100-camcc leftover
Date: Tue,  4 Mar 2025 00:39:36 +0200
Message-ID: <20250303223936.1780441-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm x1e80100-camcc was moved to its own dt bindings description
file, however a small leftover was left, remove it.

Fixes: 7ec95ff9abf4 ("dt-bindings: clock: move qcom,x1e80100-camcc to its own file")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index b88b6c9b399a..9e79f8fec437 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -64,7 +64,6 @@ allOf:
               - qcom,sc8280xp-camcc
               - qcom,sm8450-camcc
               - qcom,sm8550-camcc
-              - qcom,x1e80100-camcc
     then:
       required:
         - required-opps
-- 
2.43.0

