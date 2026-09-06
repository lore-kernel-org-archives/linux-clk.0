Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3499F43CE41
	for <linux-clk@vger.kernel.org>; Sun,  6 Sep 2026 11:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788695537; cv=none; b=M3C4fzm4r2ML8of48XbYC0N18y8kzlHb8sSLP+xSzXZTrYocBGpobUwLN6/K+D6ogcKbi8W69y7ItzLaSIzsKI55VM4NqAhNatX4SjNwfLcsi7rmFDMd0WrMieP/kSnELolAzZzmjnW3tepId1rPgvQXSkqqyDY0ZOk+eFmBf6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788695537; c=relaxed/simple;
	bh=ov6l6XYXYWQFGwdR6skU1nY1vxsBWDotX7Kg0ih6rxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i0pcV/sP9rfc5Bhggj3t77WB7FeW/sBpWDXGps381rwKe69h7864FLe2fcT5lowlvYH4tWqyP94utfC3XWfoVBqL9RbpbsXVhV2bKphUjo+6CrECKL5rHNwPaxYTiJZcAHgkVijnOPknGVd7lKm7Y+vJXm3TIMYAyFURi2WiGxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ycBRtPO8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ycBRtPO8"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso20444995e9.1
        for <linux-clk@vger.kernel.org>; Sun, 06 Sep 2026 04:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788695532; x=1789300332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LoCl+EbBl/1yupzEbeoWPgLAsEGydOXRIOMMFAJTXk=;
        b=ycBRtPO8p3If/uOWT7R1MqAjU/ZTez2bvHfLXuOUybnvLflAHhteW1Dbj+tFjdhOg4
         Zy2HLsIEcwKZp43mKWgUYx5A4bg+m7T62UGUEoBeJUgUJjAqUBrgU25JV2kQURpTlQQ6
         Czan0YzKgteyJFz+lRY6W4/U8XlJiSYnE30NeOUQfoKfz6OUjIRR4O0mh269iY3PgjI3
         gi9XgZdE07daqfRIR9d6Bya1nR7Q0Oz03AF/gmGJ+Zn/Sk/rYT2IuXyQjxd79ktBVMhj
         MP776THpWvPaUm+7UmQG3QRRb/4X9FOjfhsGXSFuJKhCYf5TrF9BhbAPvOeseUFQOA7s
         E9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788695532; x=1789300332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LoCl+EbBl/1yupzEbeoWPgLAsEGydOXRIOMMFAJTXk=;
        b=r9R+N+OsI3EccwMHLzCtDkZnwPNqA5WVUs1KkqldI5e6OiOEK+CCrbvIQNME6kOZhz
         alPW1TV95MsC7T3FgHoL5hasO5vHIEUsUxO6YSlrotqB+fPe746951ENSCkTHd8rf6nx
         f4qu+QJ3ylfIlZ6MwW/fxU7OyJLmtAFZ/nohod5aG7hsand65aiskjacZs3K9cgz4NTj
         5g8vDEN9hfAVRjs4Bxvio0rGSVaSoSvlO1pkSC6n5vygldIXhbpGsmKXul1aRlmpgtGp
         oi8YwMnaE/A2N2ynifpaviatqfDrSOfFG/kgVNk5CSaqpM8HL/pyH5ij1TzsTWbdfP3t
         NusQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfJmEtBlJi7VlV+PmJlc96/3+cQLFGj8y+sU0NphKNShrgcek5rT5KIB7oddt+tvp8/lYKa5jP6WQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mEyh+Eb/J9UO5P1BbbAy+VLeJOlwRFKaQokbkD6WVw9FZ5hPTx
	4TyPsDh+BqOmPd5k7HEgBmoL3NY42qax+phGP0tVyXFV9/8hxDsI/KhKhWr/42GgFJI=
X-Gm-Gg: AYBFou2VsXpJ6Q2TybfcWlce+Iy9W/MoyQ3EMolnyLEBclvJfv65J/JEFmpIiC2JNEs
	Mlm8WN8nbm3hUVee5v6m1YZ0jTe0SuRysqPFc8gIeW9prBn3ys/20v+YHXN1ZJWjf+vUaD/XP6P
	BSJamJPPWpo2Z2gydu+0xsDaH1ckLEweQzHG4MxXixwudk2KD1/0usF5KP0RE3NUPA88u0AC+fD
	0D7VLHXowoKeOdPvnqfffO7APb9qIu0kTwlAygJK8Z7b0JKPZKDY6JbZPTOvVM+jhkPrzzxG6DK
	Tk7jj5+0+wRSVG0vdb9jDkwUt6wh32dVNwCXRCUgsC21Ju+hT5vqO+PSgH6weINW+rMdClTlPuw
	N534OKT50ZqJmeclcnoRf/ZKTJ0jEvKpvurdmCpMK1yFC1LHexxhC1VVuvtH4FowZx6GehywCJ/
	BUHdlJpkVJS4mXo0YbungL3fHqYbK+DeDRe3Jf5kYGqlkf3TGMRyPjliTAGxZPajFUnUtS1S0T
X-Received: by 2002:a05:600c:3b1f:b0:49c:ee06:9c58 with SMTP id 5b1f17b1804b1-49cf821eff7mr167414805e9.4.1788695532336;
        Sun, 06 Sep 2026 04:52:12 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm19337821f8f.3.2026.09.06.04.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 04:52:11 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 12:52:04 +0100
Subject: [PATCH v16 3/5] phy: core: Add devm_phy_get_by_of_node()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-3-f7bd68b5369f@linaro.org>
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org>
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v16-0-f7bd68b5369f@linaro.org>
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
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnVPkhgJEj+MuSgyHrBaFkz9XqtYCTR6R+pqF1
 i/H/gSspV2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap1T5AAKCRAicTuzoY3I
 OtBAEACdIbMNteN9fIlQi8sud4+XXBijDxHoP6CT55S3kiK9pcb6if0/ESIPuE9WB8O5czjY4Em
 Z8xSqrCOb/OcUxbq33GVbInFzieoTTTN3cv+GJCWQk4eiJJLIk6RuEirjhksxUIp7dBBg5cKr7T
 hI2BSMsHBAs/Gpmh7Lyb8wa9Ik7La+p9unXLCXkkmzpkrVsqO54dLs8UQlM+HF0wZISWB8RzIiA
 /L2yFa14iwie0y+wYuEE3HzOIltEK7tGrwHwsAEOvhgb2aucn2iOBrJbPTrHOoSOFREwG1CsxzQ
 6+WD0Paz6Y9PJ8D/ZiB4UM/JoffzHDycdokAsWkF8smWh12HSqUO93+WoDX5nkqFuMAp0jwjw8A
 gtrLFNIlu4hfDprwN92bO3XtPlYWopNHS7BkspS/n2uc75t97/V2qx01UO/cpLR84eeWL8PBR+d
 tMHtZ7x7ZqngZUJJ0cRCpEvhtvNwR92W0z9Ngkc3+K2ia0VJAwbYwJHqjvJSDKbon7DnwYSdOjI
 xrY3WmbrtWp9SXzRuATt3/ctLEQcnTMXtDGx/TRAU0TWjZUl+GxkimvkTGGX406gn6JYRQfswZ/
 H9bBrjUAaF2qOVG+VF2Wg16PBCI9OV988T7IUHQiEG3WzNNMdSTzeAYEg6A9dwMk/ZCTkLSCfLM
 1qlOVKIl5v4hgoA==
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

