Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C816C36923C
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 22:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772060227; cv=none; b=PnzJIRUH9gS3drdIUKcJVlCBftq6nGy0YNUscghxWStXB2h5eoLv/c4b6Rawuzxb6WYcH3QkXMbAqocm+drkneihQ86sdLeGoXEN2Up/pFLQSpyqAGZO5zuEII8lJ5KaI41KWctWB66UfHuGe5uPUDC9wcz+uGvW4E8fJsc6cfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772060227; c=relaxed/simple;
	bh=zdISM9A13n5bpev9HW8+eKbkpO1V24XmRiHqNp5Qrzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tCuZJusU+J3HRRkb557CUDIHjmamzBEICKMxql/RjreP41sg59EF/Wb+XeI0rYSVBhzcVBnZwNM6RJScivNXwT5w4JBmebf15XK6VIUw0KhDmP04KnpeuFAfdEQdzVcaf4kdu0+f3S7iQDBjTCoKgHB0g0mbJKFfYX1FpTOOYMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JYZpTMzQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NmA+hGcI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JYZpTMzQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NmA+hGcI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772060224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7GoTj0XJIraxE36kErcF7CkdwsGLSTR+HFHvb50C3Fs=;
	b=JYZpTMzQLHVtQOmeQHmA0W0rLtrXj1VJhPR4+iQSRwcQIDTlhrxcj1oYrJFmyq3UzMZR7S
	+8XhgBdmjfngIPlDitvOmjO3AUXpDhTu2Lw3nL5ISvIwupLyqBfRhA/vNHGdPYz9UDLJmd
	7lg+SzhKATykktAsagFdSLg/DXk/dSE=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-qHC3C5GlPlq-LBBfhAkCOA-1; Wed, 25 Feb 2026 17:56:57 -0500
X-MC-Unique: qHC3C5GlPlq-LBBfhAkCOA-1
X-Mimecast-MFC-AGG-ID: qHC3C5GlPlq-LBBfhAkCOA_1772060217
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7965223b026so3489537b3.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 14:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772060217; x=1772665017; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GoTj0XJIraxE36kErcF7CkdwsGLSTR+HFHvb50C3Fs=;
        b=NmA+hGcI0Ta7jofYqCqzxr4th72qv8xiQIdYgQssal4ePG6B6hNhwqQT5H6zPJxDzV
         7iqAiDKcr+iZdxWkPgXVAgJKHBZaMEfqIBmBFMVrSfP148h9afIhEOJXarGVmKJFU93I
         njdpx0tP2SvA+/e3webeIXuWBxhgNapcKFhJCJY+bLIEpfVLY54+J8vj3tRK4LMdnStE
         G1RWMsUlqHNyd6js4YCyzNpIIr5RBXiZ4JojoELbl6BfxgunmLPBEju+NpOIGy4zVqHS
         Hch0D8VR4AHo1qWbh5VRoenQ63SN1jLukcbe7Gk1dX9WVfiDumJd8CooRwWAk9IQDmpY
         EzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772060217; x=1772665017;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7GoTj0XJIraxE36kErcF7CkdwsGLSTR+HFHvb50C3Fs=;
        b=tavKLZt2PuAE215KFjaKRE9+d+kPl/AwHBjLQV2LOfAq4FQ4RFSdIx1mwWIsQwS3Nu
         8+jt7Wz5A3ltYN5p+9lIiigRWQhTOyaKX6gb/wSvnGH3WCpWeEFaoD5uM4gG/u8Jb0l2
         bnGDhqovUK4FCbzqH6ngqz2B3fd7SXrtaYUC2ANHmHdUnaHU5i9KY8QFRcxMJJVuEwiz
         hzhv2wyE/b13SXB4Z31mtpdz4O1jauYwFYptldgmAsCeQ+lka+d/3PhJqghXUieX9tA0
         OAfO3mO45Lm10jJ+UekLhNY4bXWnp6MELZy2gZ0C5wXSEf4bYYnvwdCzqGwkXBYE7sCY
         B8FA==
X-Gm-Message-State: AOJu0Yy5mIkq5xgF7fuUUqPWCR4HTWgT5S1zENdcTXtYKaOIsoKx3CCz
	IyunD3hQFdCT8s8E7A2yVUnYVetnfvie6RIN2EHreybrabJBkWDbgQ29WNkiXOGXeG1Ns6x9etT
	kCu73MbEF1AJQutE01ODfiaRFXK0blr7FuKvX6sfilfqe6DUWgNGW6RBwo2FeSQ==
X-Gm-Gg: ATEYQzxyB61z6e3Qaw9wHli5bCTFdFpjE6frJcpJC6eKNnL0AD5xBlaji5XBCFUUcvO
	LlOVyNY+4c4T7Hk0sCFT3h3aFTGv6NXSV6DEPhnvhV7rcR7L6b8DBgDeHDvT0mcLmBpFARXaLE+
	/92NAg6NXDC/4gk3lbjKCtXyAUXiEfbPfXRMAFfhvuLTX4Dlx7LrL4+urKrNc5H3IYRFZTsYE4A
	e806HCoeTF/0vXWD8d4QTrUkq78YvJIFggfCsdxocqwCGGKD3LYj/p9cKZw9TF5ZkSb6emofOs7
	ZBWpCzIfqa4PWTU6SAEixH0P68jkMIOzHsvdjUf6s5VVrRSKPwIhDLnabUtb9BB7+ZBMb4aA+cn
	Ss+LOQGmV9MRJY06kpsI=
X-Received: by 2002:a05:690c:101:b0:796:4154:9fab with SMTP id 00721157ae682-7986ff520ddmr20295277b3.41.1772060217165;
        Wed, 25 Feb 2026 14:56:57 -0800 (PST)
X-Received: by 2002:a05:690c:101:b0:796:4154:9fab with SMTP id 00721157ae682-7986ff520ddmr20295137b3.41.1772060216778;
        Wed, 25 Feb 2026 14:56:56 -0800 (PST)
Received: from redhat.com ([2600:382:811f:bb35:ae9a:1ac7:e1d:86ce])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876ac3c0dsm1236297b3.12.2026.02.25.14.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 14:56:56 -0800 (PST)
Date: Wed, 25 Feb 2026 17:56:53 -0500
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-clk@vger.kernel.org, stable@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: microchip: mpfs-ccc: fix out of bounds access
 during output registration
Message-ID: <aZ9-NWiX4wMH3Ay6@redhat.com>
References: <20260224-briskly-scholar-294d13464721@wendy>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-briskly-scholar-294d13464721@wendy>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Conor,

On Tue, Feb 24, 2026 at 09:35:25AM +0000, Conor Dooley wrote:
> UBSAN reported an out of bounds access during registration of the last
> two outputs. This out of bounds access occurs because space is only
> allocated in the hws array for two PLLs and the four output dividers
> that each has, but the defined IDs contain two DLLS and their two
> outputs each, which are not supported by the driver. The ID order is
> PLLs -> DLLs -> PLL outputs -> DLL outputs. Decrement the PLL output IDs
> by two while adding them to the array to avoid the problem.
> 
> Fixes: d39fb172760e ("clk: microchip: add PolarFire SoC fabric clock support")
> CC: stable@vger.kernel.org
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Michael Turquette <mturquette@baylibre.com>
> CC: Stephen Boyd <sboyd@kernel.org>
> CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> CC: linux-riscv@lists.infradead.org
> CC: linux-clk@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  drivers/clk/microchip/clk-mpfs-ccc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/microchip/clk-mpfs-ccc.c b/drivers/clk/microchip/clk-mpfs-ccc.c
> index 3a3ea2d142f8a..54cfbb8be8ab5 100644
> --- a/drivers/clk/microchip/clk-mpfs-ccc.c
> +++ b/drivers/clk/microchip/clk-mpfs-ccc.c
> @@ -178,7 +178,7 @@ static int mpfs_ccc_register_outputs(struct device *dev, struct mpfs_ccc_out_hw_
>  			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
>  					     out_hw->id);
>  
> -		data->hw_data.hws[out_hw->id] = &out_hw->divider.hw;
> +		data->hw_data.hws[out_hw->id - 2] = &out_hw->divider.hw;

What happens when / if the DLLs are supported by this driver in the
future? This seems like a trap for the future.

According to include/dt-bindings/clock/microchip,mpfs-clock.h, there are
only 16 clock IDs. Could hws be initialized to have enough room for all
16 structures, and would it be ok if it was a sparse array?

At the very least, I think it would be nice to include a comment here.

Brian

