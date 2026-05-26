Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8EC3C2B82
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 22:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779835153; cv=none; b=aJIUBXheTHzRBPHfqTEPpIbUu9X/pk9b9/5ztZQUDwKQ5g3xU16W3MsiB5uargXNiQ50yR/qaj4H+6Gc/5DGbBnGOXJdj1BrQZEih7gALMzrViKjTSsmdkhyKKlgqYAw8v6e1CdWjm+dqwENtu5KpJ7Zn6DWgshm/hXnX0afcWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779835153; c=relaxed/simple;
	bh=dQ6K9GZz1ihE8mqFaYgclXUtiyeYTS0M6BDxAmiVaTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjvctKnEAyTMkE7afxu9yEt2Lil1KUti3uxtXNnTLUFfdw19SWTQSWSNw5Olhn+yltzdBy6f6imikNRmyFco222HDX7HYZcfQ10sluWHGSIizDsQxLQbqBYNpf90JPOH3MSlaitLY9lBP+pbsAJcbVsRHO0dc+2xEASTIXiCtAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RnW0B3aG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZxDxywdq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RnW0B3aG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZxDxywdq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779835151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nTo+rj9jPpTZ6MzOUwsfpt4ByYvJX/zAd699vG59KFk=;
	b=RnW0B3aGdvMQI4Ey2x0ycnR1gPvClDLCXVAiKyEMjjt/YsPbtNGmsonsAYB8cw/Rha/AKI
	Ba+xcWxcfZ7A5zu6ICaB9JkYUGxgRwSPg9f2PaK2QpHwQ4oGhXsG6T4/zilP5fqt4MzXYk
	WV/DfVsaIBS96u9wTvENjq7x8WBrLec=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-1n7inoM1Nw6RAQQMKeRn6w-1; Tue, 26 May 2026 18:39:09 -0400
X-MC-Unique: 1n7inoM1Nw6RAQQMKeRn6w-1
X-Mimecast-MFC-AGG-ID: 1n7inoM1Nw6RAQQMKeRn6w_1779835148
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-914af005f4cso691645985a.3
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 15:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779835148; x=1780439948; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTo+rj9jPpTZ6MzOUwsfpt4ByYvJX/zAd699vG59KFk=;
        b=ZxDxywdq3hIB06j0Dw3OmpwLb25CtDkc4slKZ4nkBV9PFurMybudHafUnRLCWbbrpE
         ETDuCQZfUQ81aMmYXUJv9oWcrWS83dAdZSqQLsiLMZwOH2DIshYqU51d7DWgVp/rOU1n
         dDu0Y2GDfP1Vc6LxhZekE6fSst9TK4xv0twcHAZ/A/UvoICquTcEzq2d5qfuUoVQv0TL
         VaK/yxN0XM0hZxQ0zt7lhHYrMF15JFJLPZtBTMhhLILAlZRfBLhrH8IBbaj6e2vjGNEl
         lcRrFs6l2boKoDTEwWXU3dw/gEE/e9VRwxaMsCB1g95yRAKj9S4mdnEqWvIqe1a0l8EL
         29xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779835148; x=1780439948;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nTo+rj9jPpTZ6MzOUwsfpt4ByYvJX/zAd699vG59KFk=;
        b=kE1KBm0PShwb+lliXUm72I691n5SuINqht8WNOBAScPbBI2DG1cJcktIOIg1W/YpPo
         HbKVGJNYrrH3gTkgb57SsYRlLxTrmHnroHxcAsiXgq9VDTBT49a3+j0mtIt3zDDNIa6o
         hf+DuJ1Y+44pNpO9AN2G5DD39dMiAEpSSrFSg+KqR2+WqRMzu3Vh/K9tScSVkvEdyAy+
         2Jnt8CQQZlXdrdblLsXlY+cFXcvPugQBJSWhaQ6paNSX4qu3oNIL47S8AKmBAt4Gng/Z
         PuZJ8wYkiQ56PYsiCiNN5A721J45YaK3bEX0Z6K67h3m+zjcYSWxz0SrZET7idFj7ecw
         RScg==
X-Forwarded-Encrypted: i=1; AFNElJ+3nGJKi5EUvpnJ6yPwKa5Uq7gWf9gFzU8SVmsTFmDCuXt7H+Y48zkqfO9TdhMEH77sbsjMH1fkGic=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTzfuawbI9wuc84ax1WiJfYK0q5AJtt5x40DPwLkNp04UaPiC2
	oNnTc3Cf+OO5KHKcsDy5VFK4kWNQJCNYCG+py1DSPqhXNACn6QQNWLq1do48rB6hN7j+1WDVXcp
	izvrEbh3u2QL/tvro5kb/4T02laEz4bemtIiGe876RYjvNGFk0xvvhumjxwaJZA==
X-Gm-Gg: Acq92OEJt89u67kPFo/+E/w0zUMFiWsaKnVw/nJUGRaWpJgwYvjujN0K4ACzcFT81fg
	M8vv+799K8O2KQBnLZc3ox3aGqKLUjXcV73ZkODzoOsbhjtZUzFr8GxDq7Mrph+c+eX7MPfC+xI
	t9bClm2tIl3dldTiifvPhxEPvgU1CsEx038anGUMcM8er4PCfpgzHRyf+ru8jnr6slIiUG9JBhu
	I8WmkBdF002HAZEcLDmKceM3+qTgbJWIA91bWowpfUwKQHjDOyIw6TseWMqWLwl4oJZSmqLmzkZ
	xO5c8pm0/OdigS2FPCQY58n1FMmN6YD1RRP6Q6xTwgZ40aUtFvi3YwQc+za78Je0IfiZh4JPeAy
	mHb6D6zJLh5FaG4dVzSRZRypejvlmqXJxSQ1CfsxeFDlXSTzff3lf5a2GIEojFYGfuhI=
X-Received: by 2002:a05:620a:690f:b0:914:cad9:fa2b with SMTP id af79cd13be357-914cad9fac8mr1968269185a.55.1779835148467;
        Tue, 26 May 2026 15:39:08 -0700 (PDT)
X-Received: by 2002:a05:620a:690f:b0:914:cad9:fa2b with SMTP id af79cd13be357-914cad9fac8mr1968266585a.55.1779835148050;
        Tue, 26 May 2026 15:39:08 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f8713144sm314985185a.21.2026.05.26.15.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 15:39:07 -0700 (PDT)
Date: Tue, 26 May 2026 18:39:04 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jonas Jensen <jonas.jensen@gmail.com>,
	Mike Turquette <mturquette@linaro.org>,
	"moderated list:ARM/MOXA ART SOC" <linux-arm-kernel@lists.infradead.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: moxart: remove unused variables, fix refcount leak
Message-ID: <ahYhCJ_ShikWTVc9@redhat.com>
References: <20260526204227.23181-1-grandmaster@al2klimov.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526204227.23181-1-grandmaster@al2klimov.de>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Tue, May 26, 2026 at 10:42:26PM +0200, Alexander A. Klimov wrote:
> Not only these error checks are redundand,
> those of_clk_get() return values weren't cleaned up via clk_put().
> 
> Fixes: c7bb4fc16ead ("clk: add MOXA ART SoCs clock driver")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Reviewed-by: Brian Masney <bmasney@redhat.com>

For the future: Include the version number (v2) on the subject, and include a
changelog below the --- with what changed since the last version. You may want
to consider using b4 since it'll help set this up for you. Plus it's a
much improved contribution experience.

https://b4.docs.kernel.org/en/latest/contributor/overview.html

Brian

