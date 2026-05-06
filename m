Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283D9199931
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 00:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028659; cv=none; b=Vvh7dj+0/VeRiPNfqZDeqrZPAcfJu048jxF3AcGOC+OlxgYYDLyKgX7WXAFm0qFGcBsLtgDvW0kpHAZR4XUcTXimeky4M2dGgXpsHDWz2qb6NrFtFh3uLGSGOZzDvfiITc8MySk1TgD/woNVfE2nCgSyG1MirdsnW6HPlyNQx6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028659; c=relaxed/simple;
	bh=r3QOqnwHXmLLcaVHe5A12btsP0xShC4lB7CnUlOyugw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oX5gZqK9Z2nKw1Cwc5JhejdkmNlRdoNLN5/vUq0y1Og1tcgs1e0dwea3mS7eZHEwIWZRorMC5hCpl8Rsie+nnKU1X3BhFb8cvRbVkTuQoBgk4ves3890BTaFkjbwTvNeOFjp0NWDQ8vCJidmPs6dWVdS34J5MS4C7YlkB4FltXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SZSvRA2K; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hkbx+s+Z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SZSvRA2K";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hkbx+s+Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nzw65F5VfPDb2y7ArF4gTKJVyd7SnCEPRI2Y7Ifp68M=;
	b=SZSvRA2KZXTzuH0IzLxILu5Viv2UKfhj/HFwZnUl8b41DDniCXTbIPdaJV0A1p8n5bGUwC
	sJwvPSf/cvf6INa586pXjkXpH8AzPdFG5dpA0ZBmzo4Id65yJREZnxjx1vTOmzYntPx7/W
	bBKfBCpZoPR11ku1662y8fEnUU+Nixk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-SH9NirQIO_2IfID60uKMuA-1; Tue, 05 May 2026 20:50:54 -0400
X-MC-Unique: SH9NirQIO_2IfID60uKMuA-1
X-Mimecast-MFC-AGG-ID: SH9NirQIO_2IfID60uKMuA_1778028654
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d5b5d607d1so800122885a.3
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 17:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778028654; x=1778633454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nzw65F5VfPDb2y7ArF4gTKJVyd7SnCEPRI2Y7Ifp68M=;
        b=Hkbx+s+ZKzapnBMd3PcCyHbR6neDE2ivLACFGLDFUKbbKxvMozbZMSzzN3ePTW+LJn
         PAWWu0rZ4Ae5j/Xs7PTRkpFNQeq47kOkHgqYB4PdezROanNNT/mMvpa7ypTvsJu+wi2N
         FM4CDJA2ILfngyJxDdIaIRQAd1KRfmz4CeqPHoP2fXOO/VE7d7K81qFGkYIO1Z4z4wvH
         APlm8jq4O10wHnOUBUMfOwbL7kHBpeRg4P8e8BxictiwpAJ+XYJ76ljSpqgpaOye9NsH
         sFOnN8pvg9g+zLuWBpHGyB28t1sy6Sx/s6HUSxoGq7QZiQcpH4v3NeJxD8r8ahwW7gXj
         wifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028654; x=1778633454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nzw65F5VfPDb2y7ArF4gTKJVyd7SnCEPRI2Y7Ifp68M=;
        b=QuOatUElHWI+1kh6+aSdcD9CSXMV90mpKvCOXkVs3dN8En411kCqsgLKlcbogcuZLt
         LkRvAWPSS4HwDtUTxg96z9ztyPc4VKxEMJHo+KVnjV29JCCF5lEfSuqeYesU3kAxE/2V
         xI2bhKEPOqljtnj/+KhRP9VaYC8fWtfYINvfdLLg3aC0VRFLVIZFFqkdBWB4CcoyJQsJ
         Hfm+6K8JVqvJeMYIzwiTV/dhJHOg+VYhTrwJVSbeff2nRL9y3y33edPpPNJ78fT/gcJs
         mctPHHox1hFesPIMGGu1dVXfwWw9tE8xi13k2dpYGnfhciKe6Vvn6bQlEA6xiOYV5j4r
         Zs4g==
X-Gm-Message-State: AOJu0YwHRsyliwjhXWlrBfCFpYTvtdF59JnEW2hhwNVy4MINqVvVo/Td
	uZGXtUa245QA5JDCo//ZtVtJ/d+T7nUPOK7Q4U7eWYPqToBIt4UQJcmKkpljAtidXmml07kNsRh
	77Dl//kWjvNXFEOxDAhEub0SHpVPWA/DB0RafsJMjKUU1FHhs0INxc1p3a2OfCZSKLBMfB8Jpd7
	WMinz3nOPvqBFTO6j9aq1rsdT4frZXM4UZkpMHAfQt405W
X-Gm-Gg: AeBDieuLspgdMBsK6dXaezP4GV0fpNLMQ0jTg8LzNAV7Ff09/Tbl+L8v9zDSolI2vbs
	HNDmj+2P+1uf6nSEQo8bIKdMC+lIUcVQ9nvhFPaCRDvPltwoTLg5dFgurVCdykKYY8wcCDxKakT
	Oq2IbrhbFRqUqnfEgE003RTm76UTJJuc27UCYE6tYw/lhus1jLyjKkZQcjx7d2827tT7ukvToMh
	Mstlc2qV11pwAnLE62BSEV/DzbAlhKAp4KsrsFUxTXnF+EIczS9Y+nxzL/GkTzSEN3i/9QVt13Q
	nesbACtaSu56qmqFdHJ13YjcLFwMQq/lYkhxA8WZFjwvMWWv7/cxyqymgLEV81DOkFxGPBkjod6
	6rT70Xs6fhVl/flUxOpO6WlZKyMQo6dbq23NrlXN9kUXq0yOzcUmU9tY0Bodp5f9ZzqdvC8Pw
X-Received: by 2002:a05:620a:414b:b0:8f8:5905:8291 with SMTP id af79cd13be357-904d69da21cmr215528685a.47.1778028654327;
        Tue, 05 May 2026 17:50:54 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:8f8:5905:8291 with SMTP id af79cd13be357-904d69da21cmr215524985a.47.1778028653736;
        Tue, 05 May 2026 17:50:53 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:53 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:08 -0400
Subject: [PATCH v3 12/15] clk: sprd: use clk_determine_rate_noop()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-clk-determine-rate-noop-v3-12-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1259; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=r3QOqnwHXmLLcaVHe5A12btsP0xShC4lB7CnUlOyugw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfA9Nbkmjo3nRreL7JKAMxXT6586HK1i5S/9sn9i2
 YwFbxamdpSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRDUoM/zPW/H4/wU3qzaXZ
 RrkJl2sN+ZnWOfx4Eqpx65ahz7bV32oZfjG59v19kMkl1XXqwizlJQbtvzV93i8pedC0PJJn57W
 FD1gB
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Drop the driver-specific empty determine_rate() function and use the new
shared clk_determine_rate_noop() helper.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Orson Zhai <orsonzhai@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Brian Masney <bmasney@redhat.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/sprd/pll.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/clk/sprd/pll.c b/drivers/clk/sprd/pll.c
index bc2db19aec0e..4aec30777d8a 100644
--- a/drivers/clk/sprd/pll.c
+++ b/drivers/clk/sprd/pll.c
@@ -254,16 +254,10 @@ static int sprd_pll_clk_prepare(struct clk_hw *hw)
 	return 0;
 }
 
-static int sprd_pll_determine_rate(struct clk_hw *hw,
-				   struct clk_rate_request *req)
-{
-	return 0;
-}
-
 const struct clk_ops sprd_pll_ops = {
 	.prepare = sprd_pll_clk_prepare,
 	.recalc_rate = sprd_pll_recalc_rate,
-	.determine_rate = sprd_pll_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.set_rate = sprd_pll_set_rate,
 };
 EXPORT_SYMBOL_GPL(sprd_pll_ops);

-- 
2.54.0

