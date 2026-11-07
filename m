Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794065412;
	b=cPvtJTFLEmxBHH4BcgZuuAumCL5sWra90gm6x90h2Wbqli3cGnTSgdBAYM79EGL97e8v
	 DmU4EnLBOZLkdal62xIgBByX+f4iV9BFTXE1wZu0EJDZ9yMo08kKMZigiKAaPA/3pUsvH
	 O7PlxKyYknGKmLDLnIBSQIfzG8CTLIUqPJphZTg4eiMsfSCTZLr7AyfPRIOxuOWBKzUnZ
	 2shNR0bi1bP165EogZ0DcAiGB0MDtgKoj5ssIS0zYHspOa9V3lIPklWd0yOGzPerhL0sP
	 Ke+u5v0BAGffGQAXBM4cxjVKKpE96mQ3m6FbuVpSOu53oP73HbT3MCaAL+ONc25pHIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065412;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vaEs7wb0G7SPDcuD/cuH33DllgSpImjlQDOyO4ctNjc=;
	b=TplagyQvho51Z7JzrgHDxH2BfWWbzO5fC9v5EFkL3xQLgI58aSty77XK1kvHpYMLhpn3
	 kql5OCQVn5hGZ573PJmnqpZHgy6w3RTqRkLRHn5P2+LxZISw7o8sKu6UTuSMAer0dC6oz
	 Ma3mhG3JdwiAKNnSwOTGxkmg1ALeLf/eeSq4kGC5T3t5K21CChdHrvt0B49oKG5PWrYfq
	 l4N0fVvSKzBd5seMHcAYygv87OU8WEaE8/11WYYnMQsdBDuYUcmYKTJUpF81w9hIokHJe
	 JkJJ/Ua8QRLHzJNU+Tu44syLTdmsJ39ocGsTgS8exEM/GSBnYSJE0zZlJF3sDMesE9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VKUrCAxH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C85606D80C;
	Sat,  7 Nov 2026 15:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VKUrCAxH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30BD41F008A3;
	Sat,  7 Nov 2026 15:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794065411;
	bh=vaEs7wb0G7SPDcuD/cuH33DllgSpImjlQDOyO4ctNjc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=VKUrCAxH8lbyUb6TJunrAzttSZjk+VI2dNHjkyIyGNU4B726AAilH+Fa3JFi5C90h
	 PuZrt4ZSri7SSjDCBHAyQbIWJziG+5cSV5MsH/Blyn7mcoQUZxUiDS8JA4bnbsZtgo
	 i5rpAaN4U+1aW7cgx1zWA4y4o4zBByHEm8Oii4eQFvTyxrp4TOe2rWl5VIKvuyaHdy
	 RMXCkSmK/Gcb0MTtt1gnRp5qRzkRRshO6UzjyNGVzp3EVZq1bCQrIcEfMck60yytK9
	 kbV77vLzpttWfvANiiKBmRHgXeGjEbr6MxcbsjCxQGc1sqMd/3Lg0CeN6sBnfo2r6q
	 iz51vMojvDfDw==
Message-ID: <ad7b886c-d3fc-419e-b155-3fd39fec900b@kernel.org>
Date: Sat, 7 Nov 2026 17:29:37 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: Add SM8350 camera clock controller driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, MSM <linux-arm-msm@vger.kernel.org>
References: <20261104001704.2744766-1-vz@kernel.org>
 <20261104001704.2744766-3-vz@kernel.org> <sashiko-outbox-199410@kernel.org>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <sashiko-outbox-199410@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/26 18:06, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] clk: qcom: Lucid 5LPE PLLs in camcc-sm8350 use clk_trion_pll_configure()

That's a valid issue, and it requires to make a formal introduction of Lucid 5LPE PLLs.

> - [Medium] clk: qcom: camcc-sm8350: duplicate cam_cc_pll2 parent in cam_cc_parent_data_1

This is also a valid review comment, fortunately this one is easy to fix.

Will prepare v2.

-- 
Best wishes,
Vladimir
