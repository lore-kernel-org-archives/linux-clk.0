Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DBC30B51D
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 15:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328297; cv=none; b=SdzvH8SdR839M91mWJ+WKK7d2k3iemONN06uG4D/kepD99kx29/Z02zPmJBzbRkEnucwzsmBrRuHgZQgAr38wYvM/VjuIvMcB8m5oQBcpleAcSnmcgoZhsFfpiRBq9R5PChpOdZjDeKjaxUzA8rloJYPfQv1KG+8NAssF994xX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328297; c=relaxed/simple;
	bh=pmpwcRFR76YSoAAXkAdbSM1w9EIraPLDdLWPA/OXY1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivOcIdJuM1+GXfv9swTJI4wDQvxBx/od+wUxvSUSiAOX86Axr4kL0r4DkSeiqE9Poqv0QnSaKcCQeXfRqDcDL+/Vf3vB64lFmWWMJtqNQnRok506r4RiAHWnhNJT3BTYUeoB+kvylvNGYnG5/Xgq0uaaSFN3PR+CN8Xf7nFjNME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BsmYNdr3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VZLGMNIC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BsmYNdr3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VZLGMNIC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773328294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sBmoAqiNG3UGyAdt1wXGReoZ8ZjShGiyFM8b5DDwPeg=;
	b=BsmYNdr3jf6o2FOXqumPnH6eUVams0gcBBBGxRawJdkpMoThEpuyd9L4/RNtBh5bvQLNCy
	gpaAC2/xJHcO4RJmOCldYvnNmrgfPJXlJmiv2hNo7poGR0n7fXqsxz6pvqceV6HwZ/AIUW
	IjWuV9CXw3by59FFA+Gi8ojNDOGlLuo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-Ilf7R-UZPKqehwD2sySyRA-1; Thu, 12 Mar 2026 11:11:31 -0400
X-MC-Unique: Ilf7R-UZPKqehwD2sySyRA-1
X-Mimecast-MFC-AGG-ID: Ilf7R-UZPKqehwD2sySyRA_1773328291
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd81ce6fdcso1059047985a.3
        for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 08:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773328291; x=1773933091; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBmoAqiNG3UGyAdt1wXGReoZ8ZjShGiyFM8b5DDwPeg=;
        b=VZLGMNICYN6SWx6PbeSOafKg/RCJYkeSKzYo+IMkzcp4rRTijRdO4cl4oI3ygCn+mc
         IGLi76IoSQisDoe6GtBZZWQtEjB3kIL/57Hx4BhhoVwGpVEC/jCA6XGcoKSYYBXKVNGf
         B4n+4E95FJh8rasviMKpzO7/0BD7hWYmjafnRaDvMP8tuYb113DgicNab/0WrkKhPMPH
         JegAVXOuWf+paxUl7FmN0GXLmImgCodP59zoVXT1t4MkjsN0orIj0mqWQSE6+fUuV2gz
         6q3rAQIXb26/tOaAVjWOnsKnroFK44r8/EsyKVozRksVIzjAoe5yj/MCBZviz8T7RwrE
         x/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773328291; x=1773933091;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sBmoAqiNG3UGyAdt1wXGReoZ8ZjShGiyFM8b5DDwPeg=;
        b=LD3VVino/CA9/n5QYnWYkzL199e27Y/DzsCJdIJXWhnHnfCu9SxiqdrPnTKFqDdVfs
         6+tukSQAOFOp/RekJ941UnotlZfnwS9Zcyz5dR4oLc+gtf/NzBC59RxPbxS5T4NVME5N
         HmQVu1rYViQLj/iwuuYPkcsEPnWnSoL8J8XWStuouc5T2oSF0ERWBVvqX30xuERxasuy
         mxOLsmsHqQjOa5g7H82hQHrKMjbMwneJgY1s8RfhjYdpD+mHP4mCXqXC1xGKRxVcSfLu
         mFWr2xsjrMAsXKVCB9Jz4TvF8vRvFnzTpKb9t5OKHO5qEXkH78Yp7JpFK140uzz7caUj
         Q6+Q==
X-Gm-Message-State: AOJu0YyMVJpHs2VO0suYl3VhQqnfmxY3esgAgcAgKJ7YpbAdkyEU3m6p
	MrZe4BmnfUta93HQKUkNeQitXkZgbM/wzFD8eQcrp6HNlmR6mSWmjFTg5zCV0z4r2FyXEynr7ow
	BZ/upQXGjVLUhDV34cMScfo9XwvTj5GJTHvAP5G6AmKLT6rPcoYmvb9rBwE4pIA==
X-Gm-Gg: ATEYQzzkx+erbalpgavRuSVTuIZrjMdivfQkTsfOjshyRid8SuRe6140xlvUSvXjg+m
	KMH4rgYijLryp65efyb0ILPbeROPgUtljLA4GD0o5DqScLSvKDutdRbkGJVtc77zsSIu1v9Q7Va
	MmXP3GK6H/KIcZjVhkhddD1EN4zDg8MloNE1LtSbUHTYOFKr82iAriQIeXL59PDjVgWzoqtAGaL
	akdiw8vFVt0PSZ3Y3j3iyHMFLeUilcjZoaIGB+HXPAGyASNcFU82xI1OBzUDtuE5BeauHzMNMEh
	g5ONv8366oeTEgQDB+Rg18ZnnmLSdRTEiRWRQBJkqUHpbuas1VVTKV8VdZmcqqzeRMP7ohvAIR9
	pqrhcbw7tMVRxyKemGjaY6wYTLBToV3WyUFMErGCvSnZdZ/srxaAFGmWi
X-Received: by 2002:a05:620a:f0c:b0:8cd:8569:b945 with SMTP id af79cd13be357-8cdb5a00c6amr8815485a.13.1773328291200;
        Thu, 12 Mar 2026 08:11:31 -0700 (PDT)
X-Received: by 2002:a05:620a:f0c:b0:8cd:8569:b945 with SMTP id af79cd13be357-8cdb5a00c6amr8810585a.13.1773328290778;
        Thu, 12 Mar 2026 08:11:30 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cdaac435dbsm197426185a.16.2026.03.12.08.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:11:30 -0700 (PDT)
Date: Thu, 12 Mar 2026 11:11:29 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] clk: remove deprecated round_rate functions from the
 clk core for v7.1
Message-ID: <abLXoXfraDQ_xZSS@redhat.com>
References: <aZuK4-QJCXUeSxtL@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZuK4-QJCXUeSxtL@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Stephen,
On Sun, Feb 22, 2026 at 06:01:55PM -0500, Brian Masney wrote:
> Here's a small pull for patches that I previously posted that removes
> several deprecated APIs from the clk core. Details are in the signed
> tag. I assembled this pull with the following b4 commands:
> 
>     b4 am 20251212-clk-remove-round-rate-v1-0-5c3d5f3edc78@redhat.com
>     b4 am --cherry-pick 26-27 20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com
> 
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/masneyb/linux tags/clk-remove-deprecated-apis-v7.1
> 
> for you to fetch changes up to d4851759742c1322f498021dab882d322fc34a1d:
> 
>   clk: divider: remove divider_round_rate() and divider_round_rate_parent() (2026-02-22 17:38:37 -0500)
> 
> ----------------------------------------------------------------
> clk: remove deprecated round_rate functions from the clk core
> 
> Now that all of the dependencies across the tree have been merged into
> Linus's tree, here's a small series with the following changes:
> 
> - Converts clk-composite from round_rate() to determine_rate().
> - Removes the round_rate() clk op.
> - Removes the deprecated functions divider_round_rate(),
>   divider_round_rate_parent(), and divider_ro_round_rate_parent() since
>   these are just wrappers for the corresponding determine_rate variant.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

I included this in my larger pull at
https://lore.kernel.org/linux-clk/abLV9vjYxXsKciHW@redhat.com/T/#u
for completeness. If you pull that one, then you can skip this one.

Brian

