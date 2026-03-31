Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7763F9F40
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 14:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774965933; cv=none; b=ruoiiwplUC+l7QepjD5rMC7izh3HuIIXh9CfWXTqFQN5FTB+uHPfX/XiZnaslawgHKBP6RmFjKCB3dMMTKcQxgm6YtmtCnXPEAqkDUvse4npvUL5tdKWRtVjKaTaoD02sC8MN4RtANIbSBU5uz3o5bN84nc2iF/xRBf1Fa0YZB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774965933; c=relaxed/simple;
	bh=MHPubSiQQDuhGllrpi7wOq/Rvc/2bLlTMoYFqbq0jDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOQQW0FU+Z2D/ENks4y2c7ubmpmXb5tgJVPO1BEs/yiZ1FzTv9jkjIgVdjf1dqGxZAW3LF6km1h8cKqJMfKPNZjzz94/+zKrvO/+7Ryeypg3cjSwpAz4r727Ey3DS5XSo4ndcsTRRUGFDtp9PY14gueYaZX6qwjQqdjKi/GgOXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MMRjTiNe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BGjJWCnp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MMRjTiNe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BGjJWCnp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774965928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lZCByEtmnsNYIdWYLf1KzEBvQz2XTmeXiioZ2Mxrxog=;
	b=MMRjTiNegYiq0Blnt0B3BzlLV85ZYEwrkxJiShpnJHc9IsSbO+b+Vifnxink4eEhLHJWEs
	GBNXKpSPuNVYUqzhltqRvw0Az99FcW4uFrDZrkEoG/M/5jDMiJjR+nD+yf1kT2pV1ylpuH
	Zfa1xA45G7HqLhFha7S0QE9Zk0EuAtE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-ZmLtOPh5PmCH0m1Db7YOMw-1; Tue, 31 Mar 2026 10:05:25 -0400
X-MC-Unique: ZmLtOPh5PmCH0m1Db7YOMw-1
X-Mimecast-MFC-AGG-ID: ZmLtOPh5PmCH0m1Db7YOMw_1774965925
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7ea0bb20so1474404285a.3
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 07:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774965925; x=1775570725; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZCByEtmnsNYIdWYLf1KzEBvQz2XTmeXiioZ2Mxrxog=;
        b=BGjJWCnpY/ARTTexR53z929RnNMVrM6h2sYfQabAqWXT1JiU/iHZZX4r4UTCVzPQWH
         LYngJ0cAUv/jV/KERfPTwHtdM0kCdVkHnrUncfIb83KAhpHBYq7x8wyPLew9RpAcDMTd
         MWTNQcZyeJi3mA7TQ9OVovgyqJZwGav8VgQjUSrqlmTon+OMHo7OYEre3HnyevZyOq1y
         8U9QQcHDsdD2kL/rajY0VHS5xFPfGVWUdvFnpv1P2FZoqmz6BbIW8DDrBHMIFYYcSvZD
         +cfdunJhqCYwUJ6GFHOG+zCJxvWedIfAvMOtcExf7AXAG3qwVVju8i0RHR4eWtvJ/rIH
         CehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774965925; x=1775570725;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lZCByEtmnsNYIdWYLf1KzEBvQz2XTmeXiioZ2Mxrxog=;
        b=Nxv0si1i4sRS9to14NGR8oVJKc9Hr/n1wyynfIXQ+t+qET3YO+JhLQmK28e4gFoTFP
         VyJseravgJxAeEfxlQ/IZQD7UvrM/B91RkV1QXzOQbO+53FRI4xdLWkVm8U3BktJEw+F
         I8I5F3cVz63zD6DzmAbQ+1BFb+tIC66zMK7RQcRntT+fRLOQa2YAppahD49bWukxpvL4
         SPWW+WmkFrr146W30In0YOY6mhWzKF3Z2Gh4DVdxpap+4NhS5Kv9CofefuXIKE9bkrYz
         lHKOm4ZW46pih/IY3+m41+dvSBiGEwxEc3n/umdzsn7lE97w5PkY7joDdjkhmQFGkGZP
         578Q==
X-Gm-Message-State: AOJu0YzcrpW47EB34ItLjbFnjrq143h98cLlYqzgJTLfgzdoeM0lUlAl
	UZgW4DPDACUly+jUnKTdv/iuGCZIa+vI66+qPe5179zqjnBIbFZcEWRclUy7oVxhsWBGt+csvxg
	IQsLUBspAexyUMPJ2k3Ydq99mmLTWlnzGmZlP+ihLh5Yb7tyJ/mwEs9IWH93SJw==
X-Gm-Gg: ATEYQzyV96fO1oC6dLYRb7TohKRI0GRRxj5ivzjIiMiqPSPHnTECVzSjTaUGcOWXgD3
	AYlWankxn2P6RZSiFAvC0hqVZi9hGbdGz2UNy+swaHqM5H740Op/cM+FBGyQeQHfEw7bZrogaCw
	R32bzr0JRYfBZodbfDnz2lBmc1mWiFiKvnzf5p6s+UNWuf9Dtv631i+cvYU/eifKZhQy78bSKUn
	Es1pAKbKFBveeNGmsdORIIaronfPfQqAP01qyC74HKDcdWQszQ9g2D7qZd+nl1L67+TQ/az24Rb
	cS0zcbLJrmiqt1zkh+2KAk1c7aycwI+CU+fxmirGLzCWhGaGff9IIeNLqaBGOl8pOYsTc/+TqhO
	LYAODHpu7ux5B6GJC
X-Received: by 2002:a05:620a:44d4:b0:8cf:dfc9:c0a0 with SMTP id af79cd13be357-8d01c616e7bmr2226417785a.7.1774965924885;
        Tue, 31 Mar 2026 07:05:24 -0700 (PDT)
X-Received: by 2002:a05:620a:44d4:b0:8cf:dfc9:c0a0 with SMTP id af79cd13be357-8d01c616e7bmr2226411385a.7.1774965924295;
        Tue, 31 Mar 2026 07:05:24 -0700 (PDT)
Received: from redhat.com ([96.66.166.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027edb8e0sm1021432985a.8.2026.03.31.07.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:05:23 -0700 (PDT)
Date: Tue, 31 Mar 2026 10:05:21 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCHv2] clk: kirkwood: use kzalloc_flex
Message-ID: <acvUoSOOF_9UQC75@redhat.com>
References: <20260330205504.10143-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330205504.10143-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Mon, Mar 30, 2026 at 01:55:04PM -0700, Rosen Penev wrote:
> Simplify allocation by using a flexible array member and kzalloc_flex to
> combine allocations.
> 
> Add __counted_by for extra runtime analysis. Move counting variable
> assignment to right after allocation as required by __counted_by.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v2: remove unused goto.

Reviewed-by: Brian Masney <bmasney@redhat.com>

For the future, if someone asks for changes in a previous version, then
be sure to CC them on the next revision.

