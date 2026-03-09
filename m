Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551C5258EFF
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 15:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068763; cv=none; b=hWHbRIJEFDUc7FKWjin6Rphh0gXEqg8AQSYdFYtufaF2w40SiCD6DYOn6UBuiUU3ndvNy0AjwjluwTSpefB2FaQslSr83c1kj4jYc2/LKKSpsvUZ786bMXN+cEsqK+DgtwHzzmzIMTynFuj4+59U6f6c0GwlSpL/ftpPDzJLF0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068763; c=relaxed/simple;
	bh=23VxakV/UYmp4z3dIVXbl0SreyuAJQTZFAEqej4LTh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aqaxlbbth7SVNu1xKtkJj7kdRXiUpinKxeuvGQtfJ6vLri4J9YbAYB0Ee5eZN17gqlsHl5oiEFOJxEg8aYaTW05In9CrL3z/ADdpppMyS56H37LYPw3fN0ZUlHfvbkPLquyJZNyhh0MBylshcE2Bh0XBnWr+KhlluaQydb8XILk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SqIzNX3f; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nRvg82OP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SqIzNX3f";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nRvg82OP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773068760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=phOctTNEVWSPGlfX8YVkAI1SC7tMCmOFyrrNOPwSW4I=;
	b=SqIzNX3f86fcQf4+7BmMwkX5FWw4XzoQYnpe9OK83DfDEodtC8Jg74rvKaJFEYso7v7sru
	nITD8neYIZsq8HOJmhtRLk2YZscCiM4ArM6LNqkSe2OErPbVHLACVPi9wTnZzBzgQlmIu5
	BcSgt/a7KmzbUVHxgD6oCPvD5N6r3lw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-vXUp85vcMD-iQMq-vMkBEg-1; Mon, 09 Mar 2026 11:05:59 -0400
X-MC-Unique: vXUp85vcMD-iQMq-vMkBEg-1
X-Mimecast-MFC-AGG-ID: vXUp85vcMD-iQMq-vMkBEg_1773068758
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd84943c76so776029685a.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 08:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773068758; x=1773673558; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=phOctTNEVWSPGlfX8YVkAI1SC7tMCmOFyrrNOPwSW4I=;
        b=nRvg82OPS6FK4o5I9EqzPauS8q5GAEnUpvq2uxVe0Ddh8Co5BO2RwkbZJyUd1XGQ7Q
         yulDdYXErn7BYnTDX8UmHUdghcKy35i8d+lwOnbPI8Dj1v6OnnTc8GGqOxwRFZsR+FjU
         J2r1LEa3/Pg7aWlt/Hida3f0mr1jmnyCc5TkckO2mE3aayYIrQi7crtmweNiO5mDKbUv
         iUU9ibDv2lu4tgaY8xnQ5AMB8SnJ0d47+tpcOD597L3YVRsFZ04ObMB9WZjge2NIgeGJ
         wDjhZUCUmcmoHtfpGdUc+5H5Oi8TGN7cuDOppwXfgbN6da71h2UvGPpKDczaMjzV2bi4
         PD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068758; x=1773673558;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phOctTNEVWSPGlfX8YVkAI1SC7tMCmOFyrrNOPwSW4I=;
        b=pDyMq0XjyhOk2V27iDdFpuLMgRX4gwg0bGjxMbArTs2V/2fVrthpbLw7xuIXh+SYpx
         u/zJrJOr+SzwI15KmvL+o/M11vGgjvP89cBkysnek2II0dTOdhbWBKvs6iRF6FfoBXpB
         6q0wRT8b0is/f3p9DlWHJ5MnT00TR3pevy4dsPwz+J4j0IlwgHxLC9o5aX4Ogz9nKQkf
         9QNNHCpvqhZJLgtk7Yph+vrtXwdTYrjk4SXmVoh91IJA1m8WE6mRXSMjPER0bspjnc4f
         z1F/QokmK4TMbnkhAkltjB7xqha/hByFolIbgOjx+69eGCd1o0NggKEYTVf9SYtURdCN
         p91g==
X-Forwarded-Encrypted: i=1; AJvYcCUv4aPsScR4rt81t4NZRKhFDQLP7qs+SBVoApge1z9MmtF+axIUX8vt+eofRrRNjclV2m8NORdcjZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD83vgOxaoNZCM3nv8I5XHEfRmA68nE4c900QUtU+Y9KIKimkG
	zrC8Pc8SxNxsOlZWYSgmkb1a289TJwZOZgKYPmIZY60QC730dBu/f67E8T4QJdP7GQfmdScsRPr
	ceogufa9N2A7esBq4ou5hSCU6tJORYBQSZTSPpe8Uj2Y2iJTga/9blN1jNgO2Rw==
X-Gm-Gg: ATEYQzx2+lg5drvgTj5cVOfWHMo845p0zmklodk3E21ppVFChsOpL0txMcKMaGSJ1DG
	ThHYjnw+JNI4ffgDFGFk4poqMN/07zVWu76Uh+849Dbvhyonng7yfjQJvnwN/2FUoGT7ScCNspL
	dNJ7rQw3zuge6qxFDAgIwr/g/+YE0iyArRSQP73/+osg2Gy7mT1DLbsgDHmi04tWo6KqOLT5sZp
	zAaFFbqfnQ0yupUeq3BkuJjzUtxZrUv0O1N71ZI+kR3LtcB2KTzQqso5Yw2KicNP4l79aJCsHPo
	w20edlgBvMP9dQOdAn/ztiKoLWd3bV9IOHyjbGJ6DF93RYroV1fs2tVkdDuuM3m4RlJVBfATrfC
	tZyHxoA4RISnAQFWNpby1Alfcp6urvUFvpyRCbaqMMq3NEa6DRyWMwQjo
X-Received: by 2002:a05:620a:171e:b0:8c5:2de4:d6ee with SMTP id af79cd13be357-8cd6dc5f80bmr1304761785a.33.1773068758456;
        Mon, 09 Mar 2026 08:05:58 -0700 (PDT)
X-Received: by 2002:a05:620a:171e:b0:8c5:2de4:d6ee with SMTP id af79cd13be357-8cd6dc5f80bmr1304750085a.33.1773068757477;
        Mon, 09 Mar 2026 08:05:57 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd772f9f9bsm536468385a.24.2026.03.09.08.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:05:56 -0700 (PDT)
Date: Mon, 9 Mar 2026 11:05:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 04/10] clk: fixed-factor: Export
 __clk_hw_register_fixed_factor()
Message-ID: <aa7hz_psKK6lZC29@redhat.com>
References: <20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com>
 <20260304-clk-eyeq7-v4-4-9d6bd9d24bec@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304-clk-eyeq7-v4-4-9d6bd9d24bec@bootlin.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Wed, Mar 04, 2026 at 04:25:18PM +0100, Benoît Monin wrote:
> Make the base registration function for fixed-factor clocks public and
> re-implement the various registration functions that are a direct call
> to __clk_hw_register_fixed_factor() as macros.
> 
> This is similar to how the registration functions of divider, mux and
> other clocks are implemented.
> 
> Add a new macro clk_hw_register_fixed_factor_pdata() to register
> a fixed-factor clock with its parent clock passed as a struct
> clk_parent_data.
> 
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> ---
>  drivers/clk/clk-fixed-factor.c | 52 ++-------------------------------------
>  include/linux/clk-provider.h   | 56 +++++++++++++++++++++++++++++++++---------
>  2 files changed, 46 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
> index 359e91441c74..6116f878fc8f 100644
> --- a/drivers/clk/clk-fixed-factor.c
> +++ b/drivers/clk/clk-fixed-factor.c
> @@ -90,7 +90,7 @@ static void devm_clk_hw_register_fixed_factor_release(struct device *dev, void *
>  	clk_hw_unregister(&fix->hw);
>  }
>  
> -static struct clk_hw *
> +struct clk_hw *
>  __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
>  		const char *name, const char *parent_name,
>  		const struct clk_hw *parent_hw, const struct clk_parent_data *pdata,
> @@ -148,6 +148,7 @@ __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
>  
>  	return hw;
>  }
> +EXPORT_SYMBOL_GPL(__clk_hw_register_fixed_factor);
>  
>  /**
>   * devm_clk_hw_register_fixed_factor_index - Register a fixed factor clock with
> @@ -173,46 +174,6 @@ struct clk_hw *devm_clk_hw_register_fixed_factor_index(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor_index);
>  
> -/**
> - * devm_clk_hw_register_fixed_factor_parent_hw - Register a fixed factor clock with
> - * pointer to parent clock
> - * @dev: device that is registering this clock
> - * @name: name of this clock
> - * @parent_hw: pointer to parent clk
> - * @flags: fixed factor flags
> - * @mult: multiplier
> - * @div: divider
> - *
> - * Return: Pointer to fixed factor clk_hw structure that was registered or
> - * an error pointer.
> - */
> -struct clk_hw *devm_clk_hw_register_fixed_factor_parent_hw(struct device *dev,
> -		const char *name, const struct clk_hw *parent_hw,
> -		unsigned long flags, unsigned int mult, unsigned int div)
> -{
> -	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, parent_hw,
> -					      NULL, flags, mult, div, 0, 0, true);
> -}
> -EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor_parent_hw);
> -
> -struct clk_hw *clk_hw_register_fixed_factor_parent_hw(struct device *dev,
> -		const char *name, const struct clk_hw *parent_hw,
> -		unsigned long flags, unsigned int mult, unsigned int div)
> -{
> -	return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, parent_hw,
> -					      NULL, flags, mult, div, 0, 0, false);
> -}
> -EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor_parent_hw);
> -
> -struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
> -		const char *name, const char *parent_name, unsigned long flags,
> -		unsigned int mult, unsigned int div)
> -{
> -	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, NULL,
> -					      NULL, flags, mult, div, 0, 0, false);
> -}
> -EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor);
> -
>  struct clk_hw *clk_hw_register_fixed_factor_fwname(struct device *dev,
>  		struct device_node *np, const char *name, const char *fw_name,
>  		unsigned long flags, unsigned int mult, unsigned int div)
> @@ -286,15 +247,6 @@ void clk_hw_unregister_fixed_factor(struct clk_hw *hw)
>  }
>  EXPORT_SYMBOL_GPL(clk_hw_unregister_fixed_factor);
>  
> -struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
> -		const char *name, const char *parent_name, unsigned long flags,
> -		unsigned int mult, unsigned int div)
> -{
> -	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, NULL,
> -			NULL, flags, mult, div, 0, 0, true);
> -}
> -EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor);
> -
>  struct clk_hw *devm_clk_hw_register_fixed_factor_fwname(struct device *dev,
>  		struct device_node *np, const char *name, const char *fw_name,
>  		unsigned long flags, unsigned int mult, unsigned int div)
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 630705a47129..614abb396a6e 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -1146,13 +1146,16 @@ struct clk_fixed_factor {
>  #define to_clk_fixed_factor(_hw) container_of(_hw, struct clk_fixed_factor, hw)
>  
>  extern const struct clk_ops clk_fixed_factor_ops;
> +struct clk_hw *
> +__clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
> +		const char *name, const char *parent_name,
> +		const struct clk_hw *parent_hw, const struct clk_parent_data *pdata,
> +		unsigned long flags, unsigned int mult, unsigned int div,
> +		unsigned long acc, unsigned int fixflags, bool devm);
>  struct clk *clk_register_fixed_factor(struct device *dev, const char *name,
>  		const char *parent_name, unsigned long flags,
>  		unsigned int mult, unsigned int div);
>  void clk_unregister_fixed_factor(struct clk *clk);
> -struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
> -		const char *name, const char *parent_name, unsigned long flags,
> -		unsigned int mult, unsigned int div);
>  struct clk_hw *clk_hw_register_fixed_factor_fwname(struct device *dev,
>  		struct device_node *np, const char *name, const char *fw_name,
>  		unsigned long flags, unsigned int mult, unsigned int div);
> @@ -1164,9 +1167,6 @@ struct clk_hw *clk_hw_register_fixed_factor_index(struct device *dev,
>  		const char *name, unsigned int index, unsigned long flags,
>  		unsigned int mult, unsigned int div);
>  void clk_hw_unregister_fixed_factor(struct clk_hw *hw);
> -struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
> -		const char *name, const char *parent_name, unsigned long flags,
> -		unsigned int mult, unsigned int div);
>  struct clk_hw *devm_clk_hw_register_fixed_factor_fwname(struct device *dev,
>  		struct device_node *np, const char *name, const char *fw_name,
>  		unsigned long flags, unsigned int mult, unsigned int div);
> @@ -1178,13 +1178,45 @@ struct clk_hw *devm_clk_hw_register_fixed_factor_index(struct device *dev,
>  		const char *name, unsigned int index, unsigned long flags,
>  		unsigned int mult, unsigned int div);
>  
> -struct clk_hw *devm_clk_hw_register_fixed_factor_parent_hw(struct device *dev,
> -		const char *name, const struct clk_hw *parent_hw,
> -		unsigned long flags, unsigned int mult, unsigned int div);
> +# define clk_hw_register_fixed_factor(dev, name, parent_name,                 \
> +				      flags, mult, div)                       \
> +	__clk_hw_register_fixed_factor((dev), NULL, (name), (parent_name),    \
> +				       NULL,  NULL, (flags), (mult), (div),   \
> +				       0, 0, false)

Why the extra space between # and define? It's not used below.

With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>

> +#define clk_hw_register_fixed_factor_pdata(dev, np, name, pdata,              \
> +				      flags, mult, div, acc, fixflags)        \
> +	__clk_hw_register_fixed_factor((dev), (np), (name), NULL, NULL,       \
> +				       (pdata), (flags), (mult), (div),       \
> +				       (acc), (fixflags), false)
> +#define devm_clk_hw_register_fixed_factor(dev, name, parent_name, flags,      \
> +					  mult, div)                          \
> +	__clk_hw_register_fixed_factor((dev), NULL, (name), (parent_name),    \
> +				       NULL, NULL, (flags), (mult), (div), 0, \
> +				       0, true)

