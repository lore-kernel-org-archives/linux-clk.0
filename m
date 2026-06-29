Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3AB367298
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730997; cv=none; b=D3OTktbe2Kbs8McfsZYbpUBXUDzu3i9MHcHUktySmA9F7DiKWK1/NwoB/bvkunZZExz7SvNLCrZX0PykXkYun1RB3ODCXeCZMctFHiYAxFB8ale42uUzM3BCqRH/PrXVVwDLf/KzM+SwYlodEImUhnvfm4tZy2UUjw0IiZmf6Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730997; c=relaxed/simple;
	bh=rxJWyuhBTRSB/O+mauv2DdL+vehSsvLqh+VLsRPp7dA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ja3UkZARRtl/yDsL5t6k2uUccmTtEHu0PFq/QwgYezSCV5zd4y9sBgyfotkr5YsIiAgsASubO++gxdxMYWm+4Fhx7YH5FsZH4CwtCh0GbYw8xhaLuVQCWi936x7MCBtEu7T981WmgVSZVmd4QwELlYQhrSp4Pv5oxL3YDIml9VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hovgqjww; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tiMfI7RD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hovgqjww";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tiMfI7RD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782730995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5QKyV/U/ktAcTR9z7ikOTnCGUhOOpuAU9kKgERdXtwk=;
	b=hovgqjwwr6n1YDCWkqaZkxzoGo0lMsMbZcBUrECtUWGFJcJc57cYCzAmswvFPx37hocnrM
	QTu7pFu+A9Vt6SFHFZr/FYoUbhaSU0uEqRlWV0iC2x+G6HsDkBnIwbJUg69P0FsTyPIe3K
	KuMlw9v1WNJqtLv4+0NaEd1ZukLyR5s=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-k28Nc4CsP26riaVCS9LSug-1; Mon, 29 Jun 2026 07:03:13 -0400
X-MC-Unique: k28Nc4CsP26riaVCS9LSug-1
X-Mimecast-MFC-AGG-ID: k28Nc4CsP26riaVCS9LSug_1782730993
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8eec6acbe21so46638646d6.3
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 04:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782730993; x=1783335793; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QKyV/U/ktAcTR9z7ikOTnCGUhOOpuAU9kKgERdXtwk=;
        b=tiMfI7RDiEYkd1nobvFpWcgl0KN+oO4oFg+LAeEEFhRyPT68dgBsBp81nrnRRL3Ylo
         /g9OyZqTW+7OxcIeWNkWZ1tjO7sUe4xOWNSqxuasSC/vgKpWBTzTvJVSrT5N26UfxgKM
         bXgTUGm1W5rj+U83q8O9zjKdGSySmA35LAGAWYiqpdJ5EX5tg/4P97Uydo+mCfked8Z1
         Wy74npOmLNklr6mVjZU9zaLRohY7rvbWKTSQf72VioRIEzUH6MQCm0MWuHd6NozWMW37
         cNsZh1Kddrl9jaavjoBltCLeopn71UiPrkLhpxUXOR1YCpgrYrHX0Da8FauM6hdJ4t5M
         7WMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730993; x=1783335793;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5QKyV/U/ktAcTR9z7ikOTnCGUhOOpuAU9kKgERdXtwk=;
        b=WwRArj8G4DUR5eB4T7wT23cbuJiw+h4dRS5C71f6MxOPEMCaAP6840+gYSiRMYdBX5
         QhdEkkLcq3SkeATwZSO9Il+cD8c6eTUHEZESDhZ+0XIgoGZwFfuwl/7YAlNpEH68U7Ix
         H3eOiFk52x90qLTAWLCRL8PTPl24cwDsw/KqZM29O6NlEU23r2fh/ymzNP7QYW2u7pIe
         gcin23LZX7WHi+e+gdHvXj2ASgTlVrb8GobDRO5PVGpgL18rxMWWfhLWA3wg1u7sU8Ab
         4KFtdCsDa21OJbHe6DdbNP920tQ4DRHk6Z4CPye4m2n6Us0lCvk8QTX5JBBxydojHsy4
         wbMg==
X-Forwarded-Encrypted: i=1; AFNElJ+haWrVxCiI2GhJubJvjugAnvM2SbxEQOaqfU/OwmnyMcBkjRv4YcZFxFGeYnHqIbSN7kaG39xM3NI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1NoVzAoZkjqJQ/kktCpvFgHtS4h8REU9xI7Q8djUcQku41ox3
	nRL6Qkswosfcv6NcCHjt627WWSKMs3GBlFM2yUsy9bVkBhD0SvluDcTLE+CWGRs/AGmP+3Qnlbf
	aZrDeyzwr89k2v16fH1ofabSpC/UHHLNF7zxRbULwOooadvLkHKtp+7j6GKPHjA==
X-Gm-Gg: AfdE7cl0N2A50qt1DAGL7P6GcOUbgLSsPHcVv8gZWDDUAmil0oySS4ozEpSFK/XLIky
	Kc/eeJwOaTxvAkidzM3BTejlxiPnIy0Q/xx+t45yL7KPJpA77tiKzZikdInXxW+DG6nZy1U45pL
	lZ6oHc2bxezR+4qSUKucLoMske8LMtF4hAHRnrwkmFzZbVvh/XGOyIqYsNsFNEr0daDnMkU7hH+
	i8aFLuDIJGSHV+FE5FMaHfeOnuSSUS0ZyCWIckHKgjcMiJo5GtqZDMTJTvksBHO/XxQo8DuH4Rd
	2OLZzgh+En6SqjUcuLmH45TSFvpmfEUvIubNhm+szWl8Q0oFHMAbZeH59NiwePbqhcOUouP7gqP
	jU2DSWoV7y4j6tYHyS3FBzqGIJhhrmKF0afK+XhM8G0PFMA==
X-Received: by 2002:a05:620a:2552:b0:915:efa6:d718 with SMTP id af79cd13be357-9293cade740mr2654174885a.47.1782730993024;
        Mon, 29 Jun 2026 04:03:13 -0700 (PDT)
X-Received: by 2002:a05:620a:2552:b0:915:efa6:d718 with SMTP id af79cd13be357-9293cade740mr2654160485a.47.1782730992022;
        Mon, 29 Jun 2026 04:03:12 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df81cde21csm303262796d6.26.2026.06.29.04.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:03:10 -0700 (PDT)
Date: Mon, 29 Jun 2026 07:03:09 -0400
From: Brian Masney <bmasney@redhat.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: enable ALWAYS_ON for titan_top_gdsc
Message-ID: <akJQ7ZFODBjHrqFt@redhat.com>
References: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
 <bcf9fd99-454f-4ac2-8357-b0775be42d41@oss.qualcomm.com>
 <41a76941-2e21-49ce-b0cd-0ae6a8b2eb1f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41a76941-2e21-49ce-b0cd-0ae6a8b2eb1f@linaro.org>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Vladimir,

On Fri, Jun 26, 2026 at 07:54:39PM +0300, Vladimir Zapolskiy wrote:
> On 6/26/26 19:32, Konrad Dybcio wrote:
> > On 6/26/26 6:26 PM, Brian Masney wrote:
> > > With the introduction of sync_state support in the clk and pmdomain
> > > subsystems, the following warning happens when the unused clocks are
> > > shutdown in camcc-sc8280xp:
> > 
> > Stuck at _on_ sounds wrong.. does clk_ignore_unused / removing
> > the sync state from the clock part only resolve this? There may
> > be a clock dependency for the TITAN_TOP_GDSC that we're failing to
> > describe
> > 
> 
> Let me remind that there is a series, which solves this problem in a proper
> and elegant way, it would be nice to get the review tags though:
> 
> [1] https://lore.kernel.org/linux-clk/20260331140142.892579-1-vladimir.zapolskiy@linaro.org

As I mentioned in my other message, this series didn't address my issue.
sc8280xp wasn't included in your series, so I had to make the following
change in my tree:

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index 18f5a3eb313e1..4724ea54c5f67 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -2995,6 +2995,7 @@ static const struct qcom_cc_desc camcc_sc8280xp_desc = {
        .num_resets = ARRAY_SIZE(camcc_sc8280xp_resets),
        .gdscs = camcc_sc8280xp_gdscs,
        .num_gdscs = ARRAY_SIZE(camcc_sc8280xp_gdscs),
+       .cc_gdsc = &titan_top_gdsc,
 };
 
 static const struct of_device_id camcc_sc8280xp_match_table[] = {

Brian

