Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F182A1CF
	for <linux-clk@vger.kernel.org>; Sun, 27 Oct 2024 01:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729992301; cv=none; b=kaHZvvPyBx5RpxGOia4m5+AGh1PHjh++0Vr5OMJKkl/kAGvUc2g07mP5u7Q1rWlINLS4mPwhETOA6YRfm5ZOH3pQXJFyPuWtsklt+Z5wW/3X/BWccG7Rzqm6ovwtecUdLNs4JP9Q4WVL87NFPvGp/dT0in7x0Kg3u3NeFa/ojXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729992301; c=relaxed/simple;
	bh=mHXA679fTLSBfLWh8pBmR4AEa9V2nbcklgPIdka6VnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cOZ3g8UxlU02SOcNhvmJezccvz2B1amj46S+ryltWdTTD7JbWUYP4jVC/ymz3sOEnQ5m7PW6oH1q2nFS5K5GS0x5tBBurwRAG+eWR/C6UUxBUMhCj9Jy7N411Z0Lt7b5MuMeMGQNCq7wV0EKByALFhFfeK3AveGHIQQXp9NRQ2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uTpOFdRY; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uTpOFdRY"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso3317715e87.2
        for <linux-clk@vger.kernel.org>; Sat, 26 Oct 2024 18:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729992296; x=1730597096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yljl+967ibX2I7aSbp1Ln8dspkbFoWgzBqO671H8u2g=;
        b=uTpOFdRYqqF+JFWV9jPIjF8cNlwr0Ou8bS5wxAX5lTovGPlvgc3bdnId7xPqaardlw
         YY7F1ls+AjbDhDAhdkyrnj4qqXFCu2sTUv7Ns4+lBRgIcJIFbVQPha6EhcVn6xBfp2MD
         DUinEjb8zOMJGF1jY2ceA8ykIdDtFQEKiu6wgUnYuSzlc6QHsiktpGmRXKhlYjJVfbCH
         A90HXQajFOgQuexwrPzxTqBUSwukA9O1we8d4g1aX1z6rJqUpIXKHi0vhC415gwlPs4u
         YQu4eLfA5d4GOtMg+fi8J3BCJOu8tESA8kxs8ruKjcZnFJQhMfRS2sN4YcYGAMXDn6i9
         H8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729992296; x=1730597096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yljl+967ibX2I7aSbp1Ln8dspkbFoWgzBqO671H8u2g=;
        b=ZwAIJJ1h6N7zQDViqIvUwluWgAvRJSPfTQgTIIwmSqNlVy+4hCIkrZ3BeYiYyDypIh
         3XAxcHFWXz8OsQKqe5AawfjM3ZyyjNpmyprvItN0OPVVEzy/Q5ApanDRe0Ie6ErX4KlZ
         4fhMIor0F2IMZgZ3SrAkyy/Mc48gXdHd3tiJjWJqPqmNwCvlwnLTGvvzod5Ty56jSBXA
         OCHm6HHaLiEYN4Y42YY6ioPWnnA/a/52Hxc5N+YOlg4mNetwNpOyPGw2JSLvUoHu+T37
         8zFHLqbNmXrmhnhT5GlJruFI+PSt0+8L5FaFE+VEwFzx8MXfUxkR8Qq7lV1TwzvGIN+h
         DBPg==
X-Forwarded-Encrypted: i=1; AJvYcCWaQFtljT3uGuKmXWJW+adMNBdryirfrHzJmXmAqzKVmEOX6Dmdnfw4q4fUbxHxgLpyrjnivm1VOe4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDaBhSscgCmC9iYRSKazOHSI8iAAeXKSmHj/5ODzBc2uv3kJ8A
	9v4K0LSVqBtbYHLTAtN/pHgHO9B28ktTpNKLI5IfJewuk57zqDpn2M4AHoGZn12AC50pNCqn3uw
	1
X-Google-Smtp-Source: AGHT+IG5qxpixZdbrmL55PeDyndO61JTDRo1J7bAnVb1TfaDnpj9URUSeTa7CLl3XlloJUOri2ZX4A==
X-Received: by 2002:a05:6512:1106:b0:539:a039:9bb6 with SMTP id 2adb3069b0e04-53b34a3509dmr1563148e87.56.1729992296186;
        Sat, 26 Oct 2024 18:24:56 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c901esm642356e87.219.2024.10.26.18.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 18:24:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 27 Oct 2024 03:24:42 +0200
Subject: [PATCH v5 03/11] dt-bindings: clock: qcom,sm8550-tcsr: Add
 SAR2130P compatible
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-sar2130p-clocks-v5-3-ecad2a1432ba@linaro.org>
References: <20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.org>
In-Reply-To: <20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=992;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mHXA679fTLSBfLWh8pBmR4AEa9V2nbcklgPIdka6VnY=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHZZfDiIjPMt0BkVDgLLZAGlvr/AqKeyI4nJYZ
 oYvxg3rboyJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx2WXwAKCRAU23LtvoBl
 uLRcD/9Nst3tmI3jbh5wLxlDL9O0dn7nSEkjnaLDntTJls5RFGqF8RWsLOl4MsH6/hIrMaq9zgE
 eByeDjr+irXDBEfs0n/utKHgTx3q2DhjIHJbVXuIRrBLeoeyabvNGrZCC5Z5rNr829bJ2ljCNTq
 q8uK3DshYTwWuxIsSI3HM/DYqgj6r5xtZanlFoxyOq5dqP1uqGoZ2pkDfnPcwGIP3cUOTA/gEUn
 CPQmnrHgzgElrZx0jvZS2YjSf4G6GcykgJZQaAUJGWdzzo03ZGtoOLPc38If3KDSBHT+NVWbUJm
 u5GpYSNToUz0wuHWj798OJJWHdTKvVd2yzgRR+ij+ni2ESCUeThy/TJSanYAqkwXfGFl6KqHNzw
 u23ZLNKbAybI+4PQPG17XUSEKG7+Zs56GL++SZrT05nz9AHc4UTFfV5ZGa1VX3gw18IDd9mJ2sS
 qvZ82C1mzxX4GPrxitg31HxQiriEN9DlqICM0I/oEbfjBMD3p7F5XfYjorAx8lkDizKtPyaMxFg
 acFAGnzxiXMzaeXubl+FbNn1i9PJuzseJSFZKxEX8+bUoA39VXfNfEEQQw5AHzXE3SpZmSZTJRc
 T20z62acOBiPnOxzPgMUAfiPhA50As9j2KN5gz/mlKj/pMMRC/TziOUjDDWagDCnkjj2e5Tlht0
 7Mj4jtqlv45nAhA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for the TCSR Clock Controller on SAR2130P platform.
It is mostly compatible with the SM8550, except that it doesn't provide
UFS clocks.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 48fdd562d7439424ebf4cc7ff43cc0c381bde524..3b546deb514af2ffe35d80337335509e8f6a559d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,sar2130p-tcsr
           - qcom,sm8550-tcsr
           - qcom,sm8650-tcsr
           - qcom,x1e80100-tcsr

-- 
2.39.5

