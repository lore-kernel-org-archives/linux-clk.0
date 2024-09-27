Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACCB1891D2
	for <linux-clk@vger.kernel.org>; Fri, 27 Sep 2024 10:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727433149; cv=none; b=C4ivLt+jtn98hnbrfW5YJXj4Hu7mKgcdMvno2erGrxAv/BwZKtJYXjWf92hzPEFCvQuklQcmbFixRNSuO4y2OfjMDQ6R3MlrHMRYXBCEpUITGgiw/DrUNK5tdonAABcqcGI4C1XurDD+noLDO6E3lGJg1KjUz4Ea4b70r46+Ykc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727433149; c=relaxed/simple;
	bh=5Q3cmv5EQmEMsB47Dt0/46SxxuBAOTXYPTZ6B+4yiFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bRRiyqZMVAotUfCrFC8ygReuOJTkzWZ9pwI3G+D4l1ajCZKk72K8cMUpYY807JwXDlaRFve4CpBU+tu14LrmcvtWmRP5PZWUL0+zVGIFF/1QvYtRscQfWmWy5j1AKsm9oy6ol1gcHMAb/stY83Vvtjc275r4j1u+wY87IZGemBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pEdJHcSl; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pEdJHcSl"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f8c439bc1dso1202711fa.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Sep 2024 03:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727433138; x=1728037938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52wlC560kwOQzivXvwj4mN7rE9VozvLwChFkY3NipRg=;
        b=pEdJHcSloeIA2nNjUUZqdJXtydxoTHlc1Vkhi/GLrsYHgO2rN+CCYZbyNoMbmMS/KG
         sgmlz9Y1mOWlU/rpZO6pVQ3ZIso4cadUphaWsceLawiEf2xtIRv9R8zC9EtzeOeIcpyO
         P8eI3EM7oBGcJY8NdmndmdW4x+eSnjYfd2AFOPHgCDLgjaV2H62mkdqbMzgISTDhrsBg
         LU5Ck9v1ggoyNcECqig59ebk8GBZK+0oQMi7u61h0IacuN/r108wwKSdbaNbDEU53mFW
         PYBZK5MPQ/SNUwqcQV4Drp1aRNe0ZwWGy0X191G5XhmDYp2CySauzTWc+ya7Ji2P7DLM
         vXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727433138; x=1728037938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52wlC560kwOQzivXvwj4mN7rE9VozvLwChFkY3NipRg=;
        b=ilUsCHhFwkCyWR4PdImXAjNgsxQK2NPv6QCoeFMdlewm5s/HrVnRbB8VsM/SlCi1AA
         23sRIF0/pQ8Kaipd4aW8kddKJj9TIMcfmb1u37fZ2sjPreNGZifqZxJSlLVhuqZlFZIC
         w+Q7gBuern2z2SmF0ghjp9Kiyrr77IfaU62+AlUhj5PfOctrKLXNteStqq4MH1lbKsHB
         XgR1QMKRnzJSC9Fm7WTfmr14mLo3wQ/9N4UO6l08u2SfH3ELupOpDpOqQOt6pgnVK0OL
         VRMXO+NU0vJABntIFiSrgIRnoy4Za7YzXc7Y9GdAR9N03LFCtoGRI6cuXZVQNY6R7BBU
         bsrw==
X-Forwarded-Encrypted: i=1; AJvYcCU9av0ak4zdA/ebJcstXA3doPXz1/pJd5dzqgY46+1IZNGf/+pHKAHRjHbDEgYxdtLIqH8fvHP0GT8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Xd8aFIsG2Ug4utvCs1kl8J2NZW79h6odCnpPCWyDunGD2T2D
	/jgQk2iqBoScf+dI5Kx19JEKIx1Jb/qSTnq9oSKRpZ5jUfyvf1d++c7PxVT4E2M=
X-Google-Smtp-Source: AGHT+IEuem5Ukvnh7hEKUSiof3sC+jX4FK3/GktzYOT5D48aCARk19ZzL5cPvnEJ5OxdISqq4g0xGQ==
X-Received: by 2002:a05:6512:3e0c:b0:536:9efb:bb19 with SMTP id 2adb3069b0e04-5389fc399b0mr443073e87.3.1727433138192;
        Fri, 27 Sep 2024 03:32:18 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd5e333sm259724e87.76.2024.09.27.03.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 03:32:17 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: clock: qcom,sm8450-camcc: do not restrict power domain to MMCX
Date: Fri, 27 Sep 2024 13:32:11 +0300
Message-ID: <20240927103212.4154273-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927103212.4154273-1-vladimir.zapolskiy@linaro.org>
References: <20240927103212.4154273-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was unveiled that Qualcomm SM8550 Camera clock controller is attached
to MXC power domain, therefore it has to be reflected and generalized in
the device tree bindings description.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index 26afbbe65511..9ef967523987 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -40,12 +40,12 @@ properties:
   power-domains:
     maxItems: 1
     description:
-      A phandle and PM domain specifier for the MMCX power domain.
+      A phandle and PM domain specifier for the supplying power domain.
 
   required-opps:
     maxItems: 1
     description:
-      A phandle to an OPP node describing required MMCX performance point.
+      A phandle to an OPP node describing the power domain's performance point.
 
   reg:
     maxItems: 1
-- 
2.45.2

