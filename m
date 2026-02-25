Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3BB3D6682
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 15:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032296; cv=none; b=iHGQwtfumdVUOJa/jbqsyK0eRtRUWTTAQQIgMZlFbL8d5HqvY4y8GJAmyoo+znt3A8lo/gks1S0Vp2LFQiHmDS77vVrt3GnlsAyBUWAWmKbWdRnh9F3gIHJfK3bpvk1cSUduem/g/HQdURTuAlN2xo7s9lUpLWS5VUEyHveiN8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032296; c=relaxed/simple;
	bh=y+rchs4R/gmwBMioZThqUzQ4UKpfdBxjsA6hK2x7gps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JPSsbrc2i2wiJXNkFjb3xaVqnisyp2dTFQm70hLYPEQtNMvZOGJIy26owrUTjqO8YwIoUmzS+RXqnfNmMyrET64Ft9abP8Up2Nlyvcq7oZJQRt8gDjNUQnc/jZ3OL3RFAAkf4s1yMrrMuW/2It7hch4lUvXgWlYpUeXxJmWHREk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wJv8Pi1F; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wJv8Pi1F"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48379a42f76so52285025e9.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 07:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032292; x=1772637092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFKphUeuXUEgIDtm5O4s5dZtbsXMn/VT87BVzkY2Bn0=;
        b=wJv8Pi1FeabS6OiCzW0q0ognKsP8JosAz0DFodp5wSHGheKTgWvrJtJyj7Ao41AdPe
         5vsi2zmdjM7cjk9AdMKW6jymt0hIoQwp+jhz41hvDwVL+1QMSeRNXw8svmZ2N17Iiepe
         LcUCsgIbC3cdkfhXqYx4WDe7Gl7++rU3poyNYkMn25z+XMnDMEMf0RNsoOv7f7+YcePp
         m2DVbwJhRVn2OIC92mJ4qGjq9qdaW7Th0+AK06h36ugxIo0fePIXAeM0287M9SH60mb7
         pLhYqQ8ZDYY+I2Z2rtkqTtSuxAYiSt9QTBSohyg/H7HaIvWhqWAwZuzgoS4aBsxamgsx
         zHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032292; x=1772637092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WFKphUeuXUEgIDtm5O4s5dZtbsXMn/VT87BVzkY2Bn0=;
        b=u1ixJF6UkvlZMi/SvB1nofhPblgB5UY/LRV2R5225zu6kOV64vZImHe1prjCfNk2CY
         6Ueh4M8S6mdpbZFyWIObce294d51KikL6ro0Q3EI4PzBha+8IbgkPqh5ySxO4aXNCkKx
         80QkoWgoXsP813nWeDtY2os58zX3nqRBrazomw8xDDdDBhFlRk5I8q8tgVLmTwFbGfIm
         sS2preuPcdF/Jeajydx7Dyol+hy3MY2TVcCIL6OdXm9Z1dzy3fnw70yEIs9TXykFJWoi
         hVKwvolAaqCkgSM024tybhd3WsA5MNhHdLMOdzz+cgTL2MGEbmVoVLaThqOHslHDoh86
         O5ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrWNN/g2uT1MeUeXPtO4Kx/b4wEVKWWxS7Xx7rwfJjajecsdrvp83qR4arz1xKBhV9QDRIZKymmqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCrK10Kys4JwQbK51eTLJJ3sMK91o0407ggt0EVO8Ul/tnGvoz
	vak/3WvTqYIno1JmSWVWbMqpBkw43UXD9Ojb2+hMy+6IQb8XKaja4zHDuTuZ/L8Xg0M=
X-Gm-Gg: ATEYQzyz2aNOEX+vBJluiilBFA9XR3EGOLjOt1TeE7+4+0y6K4030h/TiE1Dx1/aJYR
	N3oL+aeBTXRFuvsT/QGU5DON12/OMRPvjvW+LWSrHcc/Bxc5dgKACmAbs/KCf5/LSbgGfXW+2ps
	V2sGs00cDmYrwAhzEm+kPXY5KlfcGJ0dhLG5M7c3CGC436Xhbm5l4RGV/1BB/JrTtjOSvu0yu3n
	AOWfoDcy2Git9phFg8jmNKqBh/kc63VLqmAY8ZXfSGcIpsHkGZ52/AecXMul4KAPBFN3H7ra+Us
	obSHrrN3mptv356G2UaFsEMS5HPJ8oU6bdUMp+aDu19YZ+BWd67tOabi1iIu/qKEvjtuUoaVf22
	7IrP4emM8QusAPaUNBhfJG0n05z91kcxbLs/+c6WPplHbrsMu5A5X0QoL2k2aiwtG7V53C5mxGT
	zPA8CsY7B5DYrW1R7KrYMyeo4bGOAq9GL5DG7BOEJpx/K9ieRQ9NGlzEcrXlmXMPO0
X-Received: by 2002:a05:600c:4750:b0:480:1c2f:b003 with SMTP id 5b1f17b1804b1-483c219ec0bmr10360185e9.20.1772032292337;
        Wed, 25 Feb 2026 07:11:32 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:31 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:21 +0000
Subject: [PATCH v8 04/18] dt-bindings: media: qcom,x1e80100-camss: Reduce
 iommus to five
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-4-95517393bcb2@linaro.org>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1597;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=y+rchs4R/gmwBMioZThqUzQ4UKpfdBxjsA6hK2x7gps=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEaexXMYV9++JH7H2L8a9qBGfzVTkdNQ/vvm
 jUj14KnUNSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RGgAKCRAicTuzoY3I
 OkEMD/4us1q+EYNIFcXhTg/XgEb9cUlyyGMvwfvnag++k5c0Vi7dhmnTHI5ZZvBnLuWEtDJCdnl
 DWw+yTezyq39xBbfeLAciafoPMx5t7lKTeE/woEnbgeB2piMqAhUfp3aiFXWoROSqiJtiO7mK/n
 Q+/gPcia0OrG0bQ1X3+nxsP9RfhVu/Sr3wXVJAVL4tD26+VD3yFcC+9EjVSTuhz0L3XLZaK3AYt
 ZGS2uBKoAyOys03j/KdKL27BFbJYG6zlvs/DJBwZY5wKN9LS8ictStUjaWTufL72MJ/t0shfk6K
 +yxX7p4f9w5Wkix7PvJ8BOhGEHjCycehXGe6v/lftYHDBKW6qbagv4D/COxpKBfiePe857qhhTP
 fdtoP0tiHB5qX6zubere/oYpcZEwxBO0L3oiFP3xmJh1tvoVfTko0EejX2yeOGP/zWXuhu2lpwY
 ItdjeffzNY1H2mv01QuZgIURZmxZ16zyRr2N/W53ouLt+KMJi0wNLa902np8NpXm8ilfzvuIrfY
 g/f9Vawic0sK5Jr9j8FBXDH+KrcmP3FNNbTsgcp7rbeww/pN9oehiosW1O09Bq3h0ff2B5uKmSA
 4CUceP720YjN5iRpnwOM9+VfC8FnNMuaqDNeo0FYXOnMoo+nuLwpjGtRyo/6BPQ75VBfAq8fYTR
 Dr5vW9nwnW8qr6A==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Rather than bury the BPS and IPE inside of the CAMSS block we can define
them like the CCI/I2C and CSIPHY as their own individual devices.

Remove the IPE and BPS iommu entries from the main CAMSS yaml. There is no
upstream user of these iommu entries right now so this is safe to do.

We will instead include these iommus in the BPS and IPE device nodes
instead of jamming them into the existing CAMSS binding.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 462b1355c9fb7..d39013d4a83e1 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -98,7 +98,7 @@ properties:
       - const: sf_icp_mnoc
 
   iommus:
-    maxItems: 8
+    maxItems: 5
 
   power-domains:
     items:
@@ -353,11 +353,8 @@ examples:
 
             iommus = <&apps_smmu 0x800 0x60>,
                      <&apps_smmu 0x860 0x60>,
-                     <&apps_smmu 0x1800 0x60>,
                      <&apps_smmu 0x1860 0x60>,
                      <&apps_smmu 0x18e0 0x00>,
-                     <&apps_smmu 0x1980 0x20>,
-                     <&apps_smmu 0x1900 0x00>,
                      <&apps_smmu 0x19a0 0x20>;
 
             power-domains = <&camcc CAM_CC_IFE_0_GDSC>,

-- 
2.52.0

