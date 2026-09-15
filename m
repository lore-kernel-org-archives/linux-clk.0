Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8933A3E49F8
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 16:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490312; cv=none; b=QlVuUZN3zpTowc4RoqAWVmtRiFrl8mXTUANEyXbBoGdWSr7ERrTFweFJnBw1eIRSgO9n/NlzwJ1BBUg918MX9R4CPmFkG6jBLpH373W1OPVU4QUqkIIV/ttYy3CB8SlQIqi8oX+FlUjPhyim9zFU5CdXUCps/lA1Fb3f3uzN5jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490312; c=relaxed/simple;
	bh=6ELEPNAljckPlD6cu3sMDHyfV4ZBlNMANRsZPyU68TU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtX02dDbN2MI+s2mc1dMV71JFiUcVDZVfQsFbrTvPobyiLkbQe2HIpdffURjoX9S04HNz1+UDpUXRnE15HJqJKjd8bXMPnNIKpAVK6jO68+9dUP9TxGNhbn7Rg1kwqf0OuNXDfTsnuVo1ir+qYHMODbXBThcyhYoSuAdJqy66s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKg98tnf; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKg98tnf"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso151995e9.0
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 09:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789490308; x=1790095108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+bodKOi7EpykbglHFBM7e/cbMPilWZdOwZgiEEbG8xg=;
        b=SKg98tnf8xaqtbLzKSap6dJSsXQuOt5kjJLCtrRjFsAqM5ur8bjQheteyb4jiHYh8i
         fg+5/8C7zHx5ELXBnohA3vJoSYZ0pNKsBmtaQjzFlorUIl5sl9+eciQx3pH9LxR0dfYs
         qTvrgepmQVSNyGOHDaiWLFLhwIjKKBg/9Wd5i8Bu+F4F+/EfEDo5k6Ig/ezNxd8toriU
         D9rsnHZU/l+gsVD2Pw+W0mPShhn1CBnb6Joly6NOqbhOkdi5tzppAgr7wriOp5oPSLoR
         w69RkdRlGUFpT7cspctgicYeKuhcIEsIIwH3nWfR2npjx/7cj3r/am+EGWWsM6PR+GQ4
         eqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789490308; x=1790095108;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+bodKOi7EpykbglHFBM7e/cbMPilWZdOwZgiEEbG8xg=;
        b=GSHrUjGEvfr4YSkN91U1ekxWJG1exOeZcCZ5xrAS66B5mSTdHkRk9wl9EPNPX156gb
         YXsKfOpB0T34QlFQ+GvSuE1hijMMmhaKVewQMcImTF/PPdfVLr+VmDD6vEBYQviJwj8O
         RzpW0xeqWW8yxGADDvuf2X6Sn2xFWI1nVhEwkKEhszgGy2ZraCLawuB7V2gYHcJd3V05
         diWv2aDwQ2/kdF5Bs7HYfPSfdzLf4LglEjm81vRumsmWHoadyGmmNeZQ65Vp2/cAmI/u
         9gW8/mAdl+lTAk1InIwZVYeZUnYBrEEBvDK0su07BQN+NAfByCYXd+Bj4w5cMtZg66v+
         S0Ng==
X-Forwarded-Encrypted: i=1; AKwUvBxn5Xqbv6xpHSkk/Vs3WXAPNxCO8tkXbIkQlJEXpAsHI3TToOfTvk9J0QcQuPYE0sqItYfzESnVUbs=@vger.kernel.org
X-Gm-Message-State: AFuF++mIZlklDhLZUe+ezKQdhGogHHn+Z/xkiaUiiXX2CRkE0B1pgnPA
	1lRQvGQ4KjM9pDKePZgzeAfechZpe2njA/oYL/UWog95NIotdcUAfVHS
X-Gm-Gg: AYBFou3i+CxmCw0wQLcwqpnGdRLMArDRB+Y1kUHuNEWf1vgeXTvIRiKkEXoLljvTbG+
	fbcDvhfu/dQ51Pwx7yoNOy066PQu1LHFXzXDON0HbkSBV/kWZXzvyDsOP/nKt+hvYmTa/PkeuZE
	v5xixa93AyVf3irBJzRjpt/zaqyowaN/wvWJfgV5rNIATzSZTVeooNJGmeceDDRtE+agXrvCxMq
	HklLJ0sRswRJDPuNRrQ6brjVaO27YeL+Ys9wfEHoj9OxfA5IsJrDxD5eO3owLM6Jdkf+9PLO+LE
	Vqsa95d8VoPp0auG+Eqmax6aKhC2G77lU2Ty9FDDH+yuoc/qmENuiZo6pbPmIjoXdHpD9R7YGan
	aqGqf9x/2rnW1CxkkSKn1XSlVYKt112Enr5h4SBixyyXy+3XnlitJwii+rDBesSwhcRWUSxBeTq
	nTtKXxIzrsVAnIsvn8XYT16XCKXurgiRkzQ4CGGRRTWvfpakxvOntLune9ZUt9eQ512A8=
X-Received: by 2002:a05:600c:4e54:b0:49c:dada:f581 with SMTP id 5b1f17b1804b1-49e7a5ed78amr115583195e9.0.1789490308303;
        Tue, 15 Sep 2026 09:38:28 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83fb5021sm49735e9.3.2026.09.15.09.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:38:27 -0700 (PDT)
Date: Tue, 15 Sep 2026 19:38:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] clk: Document of_clk_get_by_name() return values
Message-ID: <b3de48fdbaaade69cce126b59bd6dfb8f437b495.1789451862.git.error27@gmail.com>
References: <cover.1789451862.git.error27@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1789451862.git.error27@gmail.com>

Callers should test the return from of_clk_get_by_name() with IS_ERR().
The function returns a valid clock on success and an error pointer on
failure; NULL is not a valid return value.

Document this explicitly to prevent callers from treating NULL as a
separate failure case.

Assisted-by: ChatGPT:gpt-5
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
There are a few other functions which look like they return NULL but
never actually do.  This is one which has caused some confusion in
the past.

 drivers/clk/clk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f1756fe59372..a71bcf780de4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5430,6 +5430,9 @@ EXPORT_SYMBOL(of_clk_get);
  * This function parses the clocks and clock-names properties,
  * and uses them to look up the struct clk from the registered list of clock
  * providers.
+ *
+ * Returns: A clock pointer on success or an error pointer on failure.  This
+ * function never returns NULL.
  */
 struct clk *of_clk_get_by_name(struct device_node *np, const char *name)
 {
-- 
2.53.0

