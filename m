Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702F03815CC;
	Tue, 12 May 2026 21:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778620935; cv=none; b=R0WSm21a28DW1Jq0GoYftSRrc9kx/nKhgwUmecIRtztCrCTIbL/4b7hXM9wmj50wbPf+1J3PyuoirNFWo8vOGwYm7+IUiCMzi+AqV0WunP1uyoVyWAZu9G9zxejzvKNqr898oDApJBDIBifUGQe7aDgbQjbM08AlkegEuW/A4qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778620935; c=relaxed/simple;
	bh=neheYQ16e4LQRDL70Fd1td2FWrpdTO29noI1ynGHDJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ory25eqk/mmSjzUyJ/SGbsPuRQTdL8zYyOw2wFm28GHvkrUiHDFXumzyVBxJkVGoUqFYbyJH/NrciZErjREw1MwVkteYYV3XGyIzLOsthHh4GHTcKnmTlMcb0p+jzxLu6ADLs8dWrJPILKzh6CRj8/xn/dEQsfboGFpT6Q7F02o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=X3kko8UT; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="X3kko8UT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=es8at4i/CAERhFcBRCXwQXn22yqr1fjECdHF96IDyEU=; b=X3kko8UTJbYtgFGymcyFrRRJIQ
	vh51YietOFd0QQLdaBhkw5N3WkH0Kw1T9e9gS+H6Q4lBUtPCfTXb1+2/WE+yroTT4L2QNuEDcGD49
	VHUGEQSYwOi2bxUd7SsUw/oBl5RBw3pJhQIlRvXm57lakXpMR721ObfBXJEu4YVWSyQE5KZvBd8Ai
	1i64PSrpkIzggYJurLBG37Nf51LeTJD8eHYXH+8zIcO8mRcgBa/2HK/c1FdOZuqwJDsXNOhR4HktP
	WJBy1pshhHkdgv6ZE0T8WCu5o9AtgOZcAM8/xSbJMDf9p3JjDKymVB4sqLE8jAvXgzmyMhIurnP3B
	aAwkAGJw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMuYO-00000000TU2-3pOQ;
	Tue, 12 May 2026 21:22:13 +0000
Message-ID: <7dca495c-e7a3-470d-846f-e5ec892fc1d3@infradead.org>
Date: Tue, 12 May 2026 14:22:12 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] docs: clk: include some identifiers to keep
 documentation up to date
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260511-clk-docs-v3-0-ed67e1065809@redhat.com>
 <20260511-clk-docs-v3-3-ed67e1065809@redhat.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260511-clk-docs-v3-3-ed67e1065809@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/11/26 6:35 PM, Brian Masney wrote:
> The clk documentation currently has a separate list of some members of
> struct clk_core and struct clk_ops. Now that all of these structures
> have proper kernel docs, let's go ahead and just include them here via
> the identifiers statement in kerneldoc.
> 
> While changes are being made here, let's also include the clk flags.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/driver-api/clk.rst | 58 +++++++++-------------------------------
>  1 file changed, 12 insertions(+), 46 deletions(-)
> 
> diff --git a/Documentation/driver-api/clk.rst b/Documentation/driver-api/clk.rst
> index c6aca8186a78..294ead519bbf 100644
> --- a/Documentation/driver-api/clk.rst
> +++ b/Documentation/driver-api/clk.rst
> @@ -42,21 +42,8 @@ clock interface.
>  Common data structures and api
>  ==============================
>  
> -Below is the common struct clk_core definition from
> -drivers/clk/clk.c, modified for brevity::
> -
> -	struct clk_core {
> -		const char		*name;
> -		const struct clk_ops	*ops;
> -		struct clk_hw		*hw;
> -		struct module		*owner;
> -		struct clk_core		*parent;
> -		const char		**parent_names;
> -		struct clk_core		**parents;
> -		u8			num_parents;
> -		u8			new_parent_index;
> -		...
> -	};
> +.. kernel-doc:: drivers/clk/clk.c
> +   :identifiers: struct clk_core
>  
>  The members above make up the core of the clk tree topology.  The clk
>  api itself defines several driver-facing functions which operate on
> @@ -64,38 +51,17 @@ struct clk.  That api is documented in include/linux/clk.h.
>  
>  Platforms and devices utilizing the common struct clk_core use the struct
>  clk_ops pointer in struct clk_core to perform the hardware-specific parts of
> -the operations defined in clk-provider.h::
> +the operations defined in clk-provider.h, and can set one or more
> +framework-level flags documented below.
>  
> -	struct clk_ops {
> -		int		(*prepare)(struct clk_hw *hw);
> -		void		(*unprepare)(struct clk_hw *hw);
> -		int		(*is_prepared)(struct clk_hw *hw);
> -		void		(*unprepare_unused)(struct clk_hw *hw);
> -		int		(*enable)(struct clk_hw *hw);
> -		void		(*disable)(struct clk_hw *hw);
> -		int		(*is_enabled)(struct clk_hw *hw);
> -		void		(*disable_unused)(struct clk_hw *hw);
> -		unsigned long	(*recalc_rate)(struct clk_hw *hw,
> -						unsigned long parent_rate);
> -		int		(*determine_rate)(struct clk_hw *hw,
> -						  struct clk_rate_request *req);
> -		int		(*set_parent)(struct clk_hw *hw, u8 index);
> -		u8		(*get_parent)(struct clk_hw *hw);
> -		int		(*set_rate)(struct clk_hw *hw,
> -					    unsigned long rate,
> -					    unsigned long parent_rate);
> -		int		(*set_rate_and_parent)(struct clk_hw *hw,
> -					    unsigned long rate,
> -					    unsigned long parent_rate,
> -					    u8 index);
> -		unsigned long	(*recalc_accuracy)(struct clk_hw *hw,
> -						unsigned long parent_accuracy);
> -		int		(*get_phase)(struct clk_hw *hw);
> -		int		(*set_phase)(struct clk_hw *hw, int degrees);
> -		void		(*init)(struct clk_hw *hw);
> -		void		(*debug_init)(struct clk_hw *hw,
> -					      struct dentry *dentry);
> -	};
> +.. kernel-doc:: include/linux/clk-provider.h
> +   :identifiers: struct clk_ops
> +
> +Core flags
> +==========
> +
> +.. kernel-doc:: include/linux/clk-provider.h
> +   :doc: clk framework flags
>  
>  Hardware clk implementations
>  ============================
> 

-- 
~Randy
