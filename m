Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F31547DFA7
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 11:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522798; cv=none; b=ae2RVRXgqdEgW1rh/I+IZK3+JIQpv+WE/mDvLa/cTlTKq52joU0dzkp+ABF+SHX09cQROtEh0vvNQLSASerixg0edcs3qEmQBbpXcEt5b1wmGjwoZL/GCiLML2Tcpq4RuDXzGZg1KBFKMZiJLvpQ2BPdahvTVgfAPfy4bLt3e/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522798; c=relaxed/simple;
	bh=ov6l6XYXYWQFGwdR6skU1nY1vxsBWDotX7Kg0ih6rxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FZ+khkDTtriruxADTdjc1lnibWT57+x6a0naKisDBTVVtoQbRcFfHvFhzBycuyD+5vrD3r6fObAb/OwXJcXoQ35wyQw4eG8fhBeMlv/GsxMagtO2OI/ezotLj1GAPTUUS4DwPWsPOjM+FOzR4jfYJSme9u+PB6t7aRCaCngNBWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BYVr1ugP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BYVr1ugP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so10008715e9.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 04:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788522788; x=1789127588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LoCl+EbBl/1yupzEbeoWPgLAsEGydOXRIOMMFAJTXk=;
        b=BYVr1ugP76EaArfin5AIFoi/luiRR4VfChYm86kx3IPXJAiIaE4jWypYxZT0HaO8s2
         HCywPntQoktYFkgGyd2tuafSbNn27S0Dl3K+6rzmugy92HTo1uLPHNCaoW3FB062Jj8F
         eASHsRJ9B79N7YKkCDngm740W27VwsmKepLP4Ek/KxUj3FF2vuqQ/L1isd1nsZoxNBpg
         ZIrCHpCRkwWwwM5N711B8pmpAOS9V2/yAwGtfoW2E/pBmXPHkGLLXlSyrYGJatf22hxE
         9wEkaUoCSDiWt1pQfG53V8isEKIYSRjYfnPl8LnLaMGERIE6ZxVUA8KJ8iBAsdTDV9FL
         GEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522788; x=1789127588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LoCl+EbBl/1yupzEbeoWPgLAsEGydOXRIOMMFAJTXk=;
        b=pCX0P0Ldh1oE50g9m0rGRlK8eeX0sSUfAWc5IEoE4VUHjETExA6elVQgcrCcJTOXny
         RGdph9qFphM0jY/gserejh0ujW/ulH6h+vDR6zblGEJ0IHpjikevP/S6m+GjzMP57DgS
         u0P37i+Yr+kESaqgu+KCiztUO5XHa+X13cU9/61Z1rzcwVhSdVErughAGsRMTo98jSDr
         NF6hf8txrKIFTeID6jvpEaXQ/blvFfDS54DoBvl4FRb7HtbQRS33FNmRfojVqT4v1Lpp
         qdQCH4kFYNzvjIzOPhZbk/KNzF/Xljaz//CbXh4Opc5qYIMCjVP58ix/5bYkg3uRYFDQ
         kEPQ==
X-Forwarded-Encrypted: i=1; AKwUvByPTKHhYK5KRqAkkqtLQti2vW2KD40SRDuY+aE8SKQZpJH+jLssEuq3HtFjMCm7Aayd2wZ1D+UKOkQ=@vger.kernel.org
X-Gm-Message-State: AFuF++npzhnLw9SfXDD0Q05jn1RDNAwXj8HJsOh0sWyO65jtHjsEot/v
	oxYa4nzyYu/ggytnEB19LNz4ai0NswEfUTM7jVV4HzZNap6uVucw9c5VJtkWUP2Eoys=
X-Gm-Gg: AYBFou2GtN+8kyII9OSPL1Lk4bc4uiy1gt4iHevC4UIe3Xj3iqJVg07FY7yUC1doEBH
	wxpzQVrmtENyPucvSObZxLkYEmeGnLddrf63wRf3Nz0zxQovHPqEGeWQ9k39zzhFJ7y8gaeZMn7
	MVuc0f6bIagZLdcuDrEsLP9gW17xbawjx9JpnuC87YHy5fT3QNEs7SvjNpdjQxHuSgu3KD/ySgX
	cEjZgBjpS2y3VkZ9t+GnUUm4HGnLpiv2wk37TbuRkcLQqq095NKkHYlbVHtibHqraDzN3bSIsnN
	CDj9tviqJKI6QjMcEkyCmztOHU8XgzmHBXMzGieisJ+ozaEkDlooeanBslCYGMF5ZnvAHRDNtRP
	ClRtBsQL5jJVOc5Fkcatsd8TmJd1vxSHvuF6kQD0U1ok9JuTlIkgaPAqpViQomHI5+JMd7CVYqP
	US2fbG+0AttRT6uF1VeMkXw20IQ8i8wWTItC1UZQumQkGYkiH/jY/CMJqd1mNLSAs+Zx9WSnO7Z
	2y/Xp+GMusj1vT9tyNZYQ0=
X-Received: by 2002:a05:600c:6819:b0:49c:de80:b833 with SMTP id 5b1f17b1804b1-49cf81fb1acmr54922535e9.2.1788522788268;
        Fri, 04 Sep 2026 04:53:08 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm5474207f8f.36.2026.09.04.04.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:53:07 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 12:53:00 +0100
Subject: [PATCH v15 3/4] phy: core: Add devm_phy_get_by_of_node()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v15-3-68b7916e7a3f@linaro.org>
References: <20260904-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v15-0-68b7916e7a3f@linaro.org>
In-Reply-To: <20260904-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v15-0-68b7916e7a3f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Felipe Balbi <balbi@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2684;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=ov6l6XYXYWQFGwdR6skU1nY1vxsBWDotX7Kg0ih6rxA=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmrEcsnrGBJeocLVI+O9+brnUFW6FqlooZlsl7
 ZQrlZxFXwiJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqxHAAKCRAicTuzoY3I
 Oh1cD/4x23nTIQZWK3SoWzTz69RZm5zv2SQvYRXMjI/nTAsWspK6u3DZytcTIZvNrPbSfUX3IOh
 03tILSVIul2ljDB/mLHI5ISqXnWDwFSZrw5TPGhQAwuLk3eSb2shn7Rpy6+gyGH2gJJyYAamMrb
 S9wnHssvLy1A37Adohv7PxZNC0woy6kZrPzZWbsWw+xrc3tLoTAW6Nk7twCcbnYNdNurrBGaY8P
 EldjRAd+h7toDSC88y8Z/NsbepmHVPJIYt+B4QDcDeVZVzp4IWW98+SlokPKjDwK7aHGUQv55Vo
 0SmqSTbXfbej0xA1J3Ey7yJQyj0DyLaz4mEuvalyTzEFC7zrHGRuZLLkGiNOatAr91JRawxt7PE
 t5WYUNGg47apx/Usr6MBKDiFJcg2vOObOITZSgN3uyEIRlY1plfy1+TrlDchN3dnbLoS/cCxW4R
 ABtFaPiEfa8GpcUTRIX57wDOZ6ntwgxpWS4JqufJenxB4+08/7oXqv94mfwXT5LroFCQ/7kMVWB
 /yKwZqPHMA4d19ViDg10ZLSCIPRsx+dp64FfoHJwszTQxrIImNLphq0gKyQKc9rqPWM9468Wlvy
 1+Vg4ExvzOos48xua7GCdEegUfYaJag2LOU3kB2fY41GNScmAfODvW8m4HpCF0nFLN36sgLfLqf
 aF+qLSyR77k9s1A==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add a devm variant of phy_get_by_of_node() to allow for the familiar
pattern of having devres automatically release resources on the driver's
exit path.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/phy-core.c  | 34 ++++++++++++++++++++++++++++++++++
 include/linux/phy/phy.h |  7 +++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 490a7cde6d40a..2e3581ecb42ee 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -1050,6 +1050,40 @@ struct phy *phy_get_by_of_node(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(phy_get_by_of_node);
 
+/**
+ * devm_phy_get_by_of_node() - devm managed lookup and obtain phy reference by device node
+ * @dev: device requesting the PHY
+ * @np: device_node of the PHY provider
+ *
+ * Returns phy associated with the device_node or ERR_PTR. devres manages
+ * releasing resources.
+ */
+struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np)
+{
+	struct phy **ptr, *phy;
+	struct device_link *link;
+
+	ptr = devres_alloc(devm_phy_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	phy = phy_get_by_of_node(np);
+	if (IS_ERR(phy)) {
+		devres_free(ptr);
+		return phy;
+	}
+
+	*ptr = phy;
+	devres_add(dev, ptr);
+	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
+	if (!link)
+		dev_dbg(dev, "failed to create device link to %s\n",
+			dev_name(phy->dev.parent));
+
+	return phy;
+}
+EXPORT_SYMBOL_GPL(devm_phy_get_by_of_node);
+
 /**
  * phy_create() - create a new phy
  * @dev: device that is creating the new phy
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 71c2e16397130..14b924a88411f 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -285,6 +285,7 @@ struct phy *devm_of_phy_optional_get(struct device *dev, struct device_node *np,
 struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
 				     int index);
 struct phy *phy_get_by_of_node(struct device_node *np);
+struct phy *devm_phy_get_by_of_node(struct device *dev, struct device_node *np);
 void of_phy_put(struct phy *phy);
 void phy_put(struct device *dev, struct phy *phy);
 void devm_phy_put(struct device *dev, struct phy *phy);
@@ -499,6 +500,12 @@ static inline struct phy *phy_get_by_of_node(struct device_node *np)
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline struct phy *devm_phy_get_by_of_node(struct device *dev,
+						  struct device_node *np)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 static inline void of_phy_put(struct phy *phy)
 {
 }

-- 
2.55.0

