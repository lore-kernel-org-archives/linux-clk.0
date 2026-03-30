Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B243D3D04
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 13:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774876491; cv=none; b=bgd8fTqXKf7vNLw/PBQz8ljnVzLtH4GPaBlWjR+JbndibaXKuUFXzYfWQnIHD65cU1jOf8bzgQTS2NrDEs/lLhVbLOfS22D12MmBJjM3m5kDeWa5g02eDDXSsE8buZPqYyaVJrVUFzyWW86OQcDSY2E56RWLsbijN5SwPW4Khwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774876491; c=relaxed/simple;
	bh=xWUiPtmlg3QaJR9RozkQ2x30hLtcVMUG8ldWdWVlZh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jox/iadPr9Q6jn9TwVcrcJ4Ub2S1RTDx/xrnbhizc+/d/54KMayJLXbsOl7zMdh3nFaDj1iC1mcpCqn1xYIObquyQ5VpP7jFhglRO7ZGPofMswbZPoWm5PITuwrv1SD5O1dHjDhXD0LbQQtRVGvSDR1N6TVCMEmfnpfH/ijfKls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H33UnkxE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qa8qUj2c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H33UnkxE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qa8qUj2c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774876488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zuPmVUCOxYLavRuCQ5BksODHBoPyY1J5S0oJ1KoaoEs=;
	b=H33UnkxEGT2VkMYtbr0LjfnQ2hFl96z6YsAZ7QV1JU3EbgBZCfUzOh55EY0dI8l/LbROSM
	JjwOfbrUgDfKMS+/yD5jbaJIBP/pe2J+2sv5//1cve3iuoiVcNx+Pv07/t6BGJj5oTioqI
	9JyJuKED6y5jGBEr6bUsCuN+q3qWRHk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-_mNrmNBvNoOU6luvBr2vgA-1; Mon, 30 Mar 2026 09:14:47 -0400
X-MC-Unique: _mNrmNBvNoOU6luvBr2vgA-1
X-Mimecast-MFC-AGG-ID: _mNrmNBvNoOU6luvBr2vgA_1774876487
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89f1daa57f3so66999576d6.0
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 06:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774876487; x=1775481287; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuPmVUCOxYLavRuCQ5BksODHBoPyY1J5S0oJ1KoaoEs=;
        b=Qa8qUj2cMp8Mt+Kr7GH5Kp2p8/6VWrfG6EO3pqNS/JaO9J423w9YSWZd21EqDcRCB6
         DxHquAMETpKhaccnPWQ+82uuOwn45rQJ/4nt387i5LCZab0py8+gTZc6NlCTI2nQ1E1Y
         FXa/E/5yxX3zeR+C82QwrIpHDdGBNwCTsl0/JImRhxES/yIUZES1rZoIEn/6MsFxb+CW
         7BwnqBlg6yTcjvhn76j/Tuc1iRCEUOhwGUKEPxp6xE7xcbgxKr0GKMPb6ggEODKP22L1
         ptI2JoAwvebaAnEPxpMtvpDeDSzXTgB2P7OoAAAs97argA4LkL6IbkhPzj9NvSpjvh96
         2+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774876487; x=1775481287;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zuPmVUCOxYLavRuCQ5BksODHBoPyY1J5S0oJ1KoaoEs=;
        b=HlXvHFrlP8duy/Nfbm4cZ+Q0f+U1WsWv1wDpZb+cAJc3KmLe4TAr0kd3Kzdaa6joIh
         XufJpkcaYheE+I9tzgCKEMhxcLWhUCKWrVd+gGijCMEge+qHPrTErQPA0QOU9LyeWkXQ
         A+/SUQ9boTv6Sy7mHomA6oj9oLNr0iCuLRdYCL0HoSimpiYOiLFonqRee4K0IkHLOfqm
         OjYNKOR+3QvzqTp5AlIVaDns4lnd9knY4tXKDshPFEuoUhC7wAF4+sT5hdZC79Qrf55Q
         UbUfft3uT2R3QhrDVmrQhxifi029k+fLeksGBYroIslPgBK8owAFTlVc7CbVGCWmohso
         fYnw==
X-Gm-Message-State: AOJu0YwVReSp+FJm5meXGtI4hfxDbq7/Dkppk0CkEsxG2qWzRhD0isfT
	3FI/F9wdGo30Qdj1mbDf6IkL9LnvsaZSytQcUBSeS6DO9kNAok8INRDjbZcVO3Qhq+sHe5Hd2YY
	qfNOe6xetIBnITkOc9yYLyLNk2tuLUgm9d0dqHQwF77Kv2gUAWzzCkKyVL+7o0Q==
X-Gm-Gg: ATEYQzwi/RbOpZ5ZQQi0/Um9zG8j1P2ZW+1nP6DXutK/mmv9LkAJAFLHpALYA7K9EPB
	xFgLnzjh5XAmzbUcno7n0DWEJZLwUI8mspkVKNBWIp8Wk+Hk3W4tp3WTUgQRV6scmTJXS/bnloJ
	xc6CuELZgOPNnk8sVfV0ha7SiDDGUS0OAW3h2cDXyYbz92iCrm3YiKtFwKHmAVB6RZi9mKxNhf8
	7al/zYznMA7GUeLSg9BXn4SYlXXtLLPwFKu5FazJwIhvvng3iB64dyP1znqq0ggACA5bYhZwhe9
	sD7jIoxjwqBH8ZaYrUlX8i/3FZ3S6gxES266q/XGrELEk47NYmw6fZtiwa1oEYuYyFooFz9DcSu
	9H4SSPLCbyrlVfXSMdsmktP+y6gKY5KBei8Tde/P/tHWK2IpHvkqEbGhG
X-Received: by 2002:a05:6214:194d:b0:89c:6bc6:e4fd with SMTP id 6a1803df08f44-89ce8d97094mr180363126d6.19.1774876486863;
        Mon, 30 Mar 2026 06:14:46 -0700 (PDT)
X-Received: by 2002:a05:6214:194d:b0:89c:6bc6:e4fd with SMTP id 6a1803df08f44-89ce8d97094mr180362516d6.19.1774876486400;
        Mon, 30 Mar 2026 06:14:46 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecf862cdfsm60468816d6.33.2026.03.30.06.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:14:45 -0700 (PDT)
Date: Mon, 30 Mar 2026 09:14:44 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"open list:MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BO..." <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] clk: clk-max77686: kzalloc + kcalloc to kzalloc
Message-ID: <acp3RH_cRGNYDpWj@redhat.com>
References: <20260326052847.335089-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326052847.335089-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Wed, Mar 25, 2026 at 10:28:47PM -0700, Rosen Penev wrote:
> Simplify allocation by using a flexible array member to combine
> allocations. Use struct_size to calculate size properly.
> 
> Use __counted_by to get extra runtime analysis. Assign counting variable
> right after allocation as required by __counted_by.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

