Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2AD21D59F
	for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 23:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741735311; cv=none; b=hmRromdHNwf+R/aLGFRea2EI+jsTkbDQmShpi6pE6AcFNVnBc/YjRng5qTZcf2tAGUyuyZUU5xo08fE7+2VpIaa3TKCnA7DzLWWkrVf+0u32tRq/4IifjqXMeDn300Cm3pvJYtHwR0claVJUUF8gyvrfdhKitP+GMM3RbDgDaXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741735311; c=relaxed/simple;
	bh=rx/tHp+P8NyavdOsZ5JVs9jCko251LXOYrZm0lLookI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPObCtsZOKzJwiUYVvMTGQcVYrWnWwcctQ61wj+QHWvX0jFgvTbSnP6Xpn6xT1Gb5G6kCMlWa3XMpEeDDEhmmi7ZEspWleaH5utp2siv623U1Id7HuUqlNQBC0Bm9K+Z2KswAoFCZ6WMwV8eWcp7ZIVB/pfYI/laxn1LNVUwkDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5xlF2X/; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5xlF2X/"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c55500d08cso185823285a.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 16:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741735309; x=1742340109; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pJxmF6WUVc5kNSkt8K1JQrgUW38NF3U/yReHT+CGrcM=;
        b=Y5xlF2X/i7Nu+Y4nXNe9X/CJ2dVmHf8mgoq01lyxt2YvNsk0xzzTr9IaTe/Y0BWOBr
         LfJchuVSYwVo2hWprVWOrhGm6SlnE/KMOBlLnqjmZTTNso441zsJEC1eyGa7ATecbNOy
         6msy3/66WwhQWmO00HbR1G+C3oAGqTGZHuDwcrGdOFFJugfoROR+UtjY+Alfd5/qDwZ2
         egAD3yBC9QTtrt+/qlbNxnr9IdEbij4I69VHRpgGE+ZZ6HEWplHXpb0RnWp1AdR/jVay
         GBVtsznUKytfzj3pHWqsvDqUVtBSa2CTRQZOOH+ysYxTEonC34R2f56Ku1r3DllD3I0f
         vB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741735309; x=1742340109;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJxmF6WUVc5kNSkt8K1JQrgUW38NF3U/yReHT+CGrcM=;
        b=qj4fA9RjhlmW7HbmAUJL1PaSAmeuNZDll8z1UrmOS9QcMPB6pX2VnKr82oMw0n32A0
         HnoGuzPeLltxqumMF0zRKGApI6QnxDpZyJTMDH6lamaEt7MH5syX57DtDpjdeGAsjztB
         yIzG1HrD82QIkllzHrjlYscXoqYlqWeA5PHGsQWFu79rQc2r4ohqh/BL9BcIvzHVgm+X
         K8xfGJ7CYzTeERdP/a2tCilPKUuv6Co9FF5zT1+UyOI3TCyUeyr8C0GYzxuSOgpTu5R5
         419eXKmyBrYtzwaoOWlKVJ2UYQ6iibViJH8sObTDTJbPA0/c/+6f4Gnkbc5G7C70Py2A
         NX2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXg3J+nPpSn8u9MN1iPEpK2ORDaNQOMlWjP0FZY+797CBj0CYAO6GiqQYTMgILNEryFIztfoT8ssN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNKsnDAEif484od6RGXzUkYV2owVnyS6lGMZmI/rrVt+9q831c
	8SdAlBkGywqmd6Fuijn+V7GmwOHuG43aKr1f6xm7xgODaw/dk7zF
X-Gm-Gg: ASbGncuV6XiFxx6hQneKaLIzS6hx6iGjNbrtBcazsdqQsXRBYuOqJWdVOsgDQeVaTLO
	Hp89OkWRycA5y+D6z8sKJk3f5RZlhhXIgTqVSGJzSETNIo3IdTX7o2QC7voOj5rZK7HgBjrjPKn
	4tMDnpMUfSSg7zzz4rlpriykdydyZfipkPDe2c/Xc6FHKdvlnBj/flFXc/1FzWEmscqheCEyFBN
	kSbu9bJ0z9WpnT/K73SfBWeW4o7U2eihVR2U3QjQHcD9H+Lwt31kpwRdyOz2qaBGMNvUDzdeNmV
	+6pyXDAWgOuprxYNCm80BAO2Y9QJ4o4=
X-Google-Smtp-Source: AGHT+IFc2n+8e2vw/uDNxiC07QwRLTMDbQw8VNTcBIu1VuuEqaEF5tPNOqcxmCKXAvBGFAeajVuzcQ==
X-Received: by 2002:a05:620a:8706:b0:7c5:4be5:b0b9 with SMTP id af79cd13be357-7c55e89a129mr782406285a.28.1741735308703;
        Tue, 11 Mar 2025 16:21:48 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c554dcbb2bsm390858485a.84.2025.03.11.16.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 16:21:48 -0700 (PDT)
Date: Wed, 12 Mar 2025 07:21:41 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-clk@vger.kernel.org
Cc: linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Xiaoguang Xing <xiaoguang.xing@sophgo.com>, 
	Chao Wei <chao.wei@sophgo.com>
Subject: Re: [GIT PULL] RISC-V Sophgo SG2044 clock drivers for v6.15
Message-ID: <znylrcmmd7hwbxg362cyurw7pyp7szivlab42rpncswx6huzsr@w2cyodntxok3>
References: <PN0PR01MB10393DBCE92A34489031BE9BEFED62@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN0PR01MB10393DBCE92A34489031BE9BEFED62@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>

On Mon, Mar 10, 2025 at 03:34:08PM +0800, Chen Wang wrote:
> Hey, Stephen,
> 
> Please pull clock changes for RISC-V/Sophgo/SG2044.
> 
> I send this PR just want to expedite patches for this clock driver. The
> patches have gone through several rounds of review [v1], [v2], [v3].
> 
> Link: https://lore.kernel.org/linux-clk/20241209082132.752775-1-inochiama@gmail.com/
> [v1]
> 
> Link: https://lore.kernel.org/linux-clk/20250204084439.1602440-1-inochiama@gmail.com/
> [v2]
> 
> Link:
> https://lore.kernel.org/linux-clk/20250226232320.93791-1-inochiama@gmail.com/
> [v3]
> 
> Thanks,
> Chen.
> 
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/sophgo/linux.git tags/riscv-sg2044-clk-for-v6.15
> 
> for you to fetch changes up to 135418add3878dcd44483d0f2851f6f470a85395:
> 
>   clk: sophgo: Add clock controller support for SG2044 SoC (2025-03-10
> 12:22:01 +0800)
> 
> ----------------------------------------------------------------
> RISC-V SG2044 clock driver changes for v6.15
> 
> Sophgo:
> Added clock support for sg2044.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> 
> ----------------------------------------------------------------
> Inochi Amaoto (2):
>       dt-bindings: clock: sophgo: add clock controller for SG2044
>       clk: sophgo: Add clock controller support for SG2044 SoC
> 
>  Documentation/devicetree/bindings/clock/sophgo,sg2044-clk.yaml |   40 ++
>  drivers/clk/sophgo/Kconfig |   11 +
>  drivers/clk/sophgo/Makefile |    1 +
>  drivers/clk/sophgo/clk-sg2044.c                                | 2271
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/sophgo/clk-sg2044.h |   62 ++
>  include/dt-bindings/clock/sophgo,sg2044-clk.h                  | 170 +++++
>  6 files changed, 2555 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/clock/sophgo,sg2044-clk.yaml
>  create mode 100644 drivers/clk/sophgo/clk-sg2044.c
>  create mode 100644 drivers/clk/sophgo/clk-sg2044.h
>  create mode 100644 include/dt-bindings/clock/sophgo,sg2044-clk.h
> 

Let's cancel this pr. This clock driver still needs some
improvement.

Regards,
Inochi
