Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645D523EA86
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 13:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569448; cv=none; b=eVipYdsfS5uAkasgjrLK9zOh0BpOf9LJzzSChtrvLkTI0+fLsNHpxgDq0q1zfeWP/fy/jsf6QVuV0QT7Mh9chXOdC+g6QeBAi/u+MD/b9yq3nfQlNGP2yFt6zDWhtUO+m1FnPI5kGBmsu0BUuDUjsa5DGTskK+UP1SWD9ISEQg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569448; c=relaxed/simple;
	bh=bCuXidJmykHrH5/xvuIi+xpUlM7CPaWZgEz+0RvmlPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mjU5L5xzqG3pB/W62kJb2rRCzciyGNTrt2ogtJKbaq4Sof7wcUjrAIxAB7O78DHlz/sbXQYC92NkjbboG6ClDnuTfVBg1h+KsTeghTlEAk4X1iup/53kWTGO/YxuLLJToK1RkWx/R1PpYdPPQjgwuxN6B2CRr9EkRw9rjfZfnbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=QTM7us57; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QTM7us57"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b86f3e88d4dso340198966b.0
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 05:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768569445; x=1769174245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dr1dBlLLfYPYJFN+bHMPl6dVd/Smnn8ihazbVyoDL5M=;
        b=QTM7us572usDv7AeGtPhpASxDmrX5F1AwqpHR7EV525CzknOU59DMIueJ8/VjToFvg
         cmEbT08FyE+QFpO1L9Pvc7OO3NSk18sq6LSW7yd8Nf3Qj74DrdbTeS9uwghxelNNCYj0
         LERiEbgHdZYprYoKOvRSCBPRRWqDqk7SxWe7ek7yrWQibjUTKH4JbxkEzBSYQPgCJR4O
         hSko0JfMSbPqjMGtbQMmLTHXw5ji3D6rbmqiUg8GN6bFi+RSe5NxppaLXgyEIit8+M3/
         Fz3LKIeuKHYXCi5e7rFp+NsStST4khP6gAaawa3qImFMxQgMtNl4cY7g4h47GulLih//
         n+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768569445; x=1769174245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dr1dBlLLfYPYJFN+bHMPl6dVd/Smnn8ihazbVyoDL5M=;
        b=em9bLcLUJiOIBiQtmFNxgNYiAs7m29Rnc/n5xvFcUUTDIiEXRB1ZzmbJwA9mHlSsmB
         5GQnk9+RTWEb2G8J8ph7Ga8/u4JAJmCz3dBEYYv1E99ljbbZ3U2fsc1C7tA7n1grRtQn
         4EzhSyVWBMJ3FzV5zaRs03xmdvF/Irzz8ahG3ouVQttMSmr6zVycoWylP1zwtEFVgt8q
         0sM8qR4mAKXLwdV3xO4AwpFRroiYILfGkUGzuuHoHr4iOvn5pKNj/X26kQqQ5qXgY3Qs
         gldQ/KTzOG8y3JNrOgjP8D+chGjPD/27aFAcjCg1PCpkNVhLH1ZAewXLIaeYab4Ab7Sj
         M57Q==
X-Forwarded-Encrypted: i=1; AJvYcCWy+CsKMoSb/tJl6+VX9nTNArZtm6Zl64CNW6UO07c4EQRSO0loaK4O01VzsVRQzPAPddwAVBxv9IE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7yjUy2oiIz6joeaL8+W6YQPByhHmXidgVNM22vPTo13RR1RDb
	3BQfSRTunWKLVmdm1+i5IGn4AKsJN0WJHtZ+rSgXrKhSL+wvm4JTvoL4ycDVB6LfUYk=
X-Gm-Gg: AY/fxX7H3IB7rQBORJ8VmXIb71t6ARbYUbkAxN5IrRTUGwALJEJGp0Ffj1L/CcfYZFS
	Psco/uL4EFMHj1hJglRFb9YAodVVCHFtwKHE59uoO8LTFssJ9JCj6BdnIZe1EtdAHsqjBNH7ZeU
	TbvCe9lqz0dbv3lWGNYK0Z50lxE47iBIsJZCJzZKxQOEdBOYdq1DAuC2h6NOCEw8zd1/s3+Ll+H
	Q2wdi7N8+9tb5I2E9KaNx+bfaEHB3tQFg2a1YBLwffJBqm2jFGP3YGGbWShdK76BNuRI6sLrrOl
	/9nZeOCzzrgBqXYCVbFlXBJlWkuUprrerom277dSYndRXYzCIGNBXOmiv5tPzD980aY04QltDzA
	GxF5tdKSFXDp2RiZBqX5naAR13B99Jx5AOjGVw7WVe+GB7uAr16e3bnLrUzWmLGYZU/9RS6hYm4
	rjuUWZP4aZl9a3EGjlVUN10sdkblVyLTuQgb77seIIV/UtG8hqeDBsQLsqx4RT4VJQ
X-Received: by 2002:a17:907:1c09:b0:b83:f538:c2a6 with SMTP id a640c23a62f3a-b8792d273femr262706366b.6.1768569444776;
        Fri, 16 Jan 2026 05:17:24 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a350dbsm235507366b.69.2026.01.16.05.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:17:24 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 14:17:20 +0100
Subject: [PATCH 1/5] interconnect: Add devm_of_icc_get_by_index() as
 exported API for users
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-camcc-icc-v1-1-400b7fcd156a@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768569443; l=2212;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=bCuXidJmykHrH5/xvuIi+xpUlM7CPaWZgEz+0RvmlPc=;
 b=gWnOVQzJkci4lXcmtXJVm6rHU7f4/LCiwxPAkRBMrt9HO3Y81FpwwOdbP5nuH44jBz3Bhr6mu
 g+++h/05vt9DCDUphmho3T0LS2WKvANznToIrzPt/SpmQ9c1vKStIai
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Users can use devm version of of_icc_get_by_index() to benefit from
automatic resource release.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/interconnect/core.c  | 20 ++++++++++++++++++++
 include/linux/interconnect.h |  6 ++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index 6cc979b26151..2242554525df 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -443,6 +443,26 @@ struct icc_path *devm_of_icc_get(struct device *dev, const char *name)
 }
 EXPORT_SYMBOL_GPL(devm_of_icc_get);
 
+struct icc_path *devm_of_icc_get_by_index(struct device *dev, int idx)
+{
+	struct icc_path **ptr, *path;
+
+	ptr = devres_alloc(devm_icc_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	path = of_icc_get_by_index(dev, idx);
+	if (!IS_ERR(path)) {
+		*ptr = path;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return path;
+}
+EXPORT_SYMBOL_GPL(devm_of_icc_get_by_index);
+
 /**
  * of_icc_get_by_index() - get a path handle from a DT node based on index
  * @dev: device pointer for the consumer device
diff --git a/include/linux/interconnect.h b/include/linux/interconnect.h
index 4b12821528a6..75a32ad0482e 100644
--- a/include/linux/interconnect.h
+++ b/include/linux/interconnect.h
@@ -47,6 +47,7 @@ struct icc_path *of_icc_get(struct device *dev, const char *name);
 struct icc_path *devm_of_icc_get(struct device *dev, const char *name);
 int devm_of_icc_bulk_get(struct device *dev, int num_paths, struct icc_bulk_data *paths);
 struct icc_path *of_icc_get_by_index(struct device *dev, int idx);
+struct icc_path *devm_of_icc_get_by_index(struct device *dev, int idx);
 void icc_put(struct icc_path *path);
 int icc_enable(struct icc_path *path);
 int icc_disable(struct icc_path *path);
@@ -79,6 +80,11 @@ static inline struct icc_path *of_icc_get_by_index(struct device *dev, int idx)
 	return NULL;
 }
 
+static inline struct icc_path *devm_of_icc_get_by_index(struct device *dev, int idx)
+{
+	return NULL;
+}
+
 static inline void icc_put(struct icc_path *path)
 {
 }

-- 
2.52.0

