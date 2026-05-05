Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3910A421EE5
	for <linux-clk@vger.kernel.org>; Tue,  5 May 2026 12:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983479; cv=none; b=r3U1wOE0E9S7ySLdI0D7KWYzLQcTOi4kKZ9KpqzRG44Qv64R8n2xFaQWJJYcxhxoATGahkG0AOl+vhTshWR5QG65zfxuMrR3ItDkqsUmEieQ1bsrxBoiQkChWyN3u2UhvsRnO8uEM4mDWQbkt5GE2sKCrxoL/zXCuZFUaaOlPE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983479; c=relaxed/simple;
	bh=l/41ncjvsWNG/pOaCT3/ej2L9B5PHEMsEQj3Jxazb6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cfdnSrIMps6oA+5jHLUisI7PRe6lyONFsTivNkbLDe33RDI1UEz1mGKiPTwzBSjsRvwoFgx+a5SGUF3VuspbDipEHJTF6t+TT7K0ZY2ct6diHSrA0SZXjOeFmffipaWseKNqa7i2qDIX5uLrFq/CJveDitc5geZLeHv+rxrImYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-95d3492fb1eso324422241.3
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 05:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983477; x=1778588277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mx10RFm2VbKGi60P1ByLYAwwUUKZhzhPZIKANt76f2M=;
        b=rROZIcTxoOXFESASVhxztkbnosGge60RiNgeudMhK6Le6m3Ss/pjWWfKL7PeQUvBTa
         fvNRX7QGYW2N+Oq/EreMZBkwah20qDSo+B0E3PHWL/PcTtSMBClp/B2/g9P7AK8oYhPJ
         6kL/Mk5FPse4TpPzDii73MQOU5c7mKxCVcghadW3zUitRfx3zACbx53OaxKRBxCnjM72
         F6FuvaGl030hDW4mBUqrOCW3e27F5iprz+mtBk4H8KFOMrpIiibsUj8x4B1QG+hYN2jY
         70LNOs89Ycyl2HYo02r5p8UJiEy2XFVd7/lyLvf8gip0vGkqgpa9ofqf9t8y0VLSOLE+
         vPlA==
X-Forwarded-Encrypted: i=1; AFNElJ9EyXfc6Ee3ZdFpsifoy9msTgfUjY53n6X5s1JBXI7s2pIZ/g3G9BksGk1wiE1/SIoD+zNylCOmhQw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztf2jSsIZi2pfjP8mhdQwV38l5MgdNQoiSrCeLU93APSi8/+Hu
	VXBUJf+mTdfLFz8MSfESAYENoKdnnpUcujVwVgxT9rnzxhaPlqP3yCZKKUg3IDlx
X-Gm-Gg: AeBDieuekxQC6E0fWeb94oDigsvyrdKtt4OSDE807ZwX2COtGrm2by1v7Nug7qfvrYn
	GmtRKt0+WU+czhxosVdtYJDfFA9zL4h68Lq920gTfA/IpOHePwA5gDTsFN8d6+Y29OpJhGMAanA
	Wj5KTLZep8R97pgG1WQPQMVpYzvBnr8Jq3Xfhz6FzgOPQaH/x6A4lMrL3jIcNUVRWDZlq+pOAMG
	xRqfVdO3c6xUkthNHqhI1wdBUBwL8xidOAdCX89dxOU7+seCcq4NrejJ1EgRFhJfhf/vi7MQcFW
	bqPo22U/H54/50Ub42OI3NmzbuWAHzIIFxD0sPfW5t4DA9f96rAha+LjZtKAnSg2kre8TdYAxwh
	y0nTw0mc7KuFs+RanTo5Tt11BqbZK+LrdsPS14BkA8B6ZS35uaaZQ8OYkSg+nSOy7jaeojQPKTP
	cDXYVJY6b1CTsBzdjt/3un+JVpB3hwOPkO0NdvHDDcu3/3p8ZMfyJV48JqN0POdSULeoKoM6zae
	RE=
X-Received: by 2002:a05:6102:508a:b0:60a:cd0e:5cee with SMTP id ada2fe7eead31-62f590bfaedmr1242329137.12.1777983477056;
        Tue, 05 May 2026 05:17:57 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62bfddbc09csm6686883137.11.2026.05.05.05.17.56
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 05:17:56 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-573a81abef0so3301158e0c.2
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 05:17:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9L4t8GHIVOZNgNfK15z6TzvqMRfDAz6JrjGCeVdub4sOXjoIcUMVrBAI0lv8yjD4mYwiD2p+tfQJQ=@vger.kernel.org
X-Received: by 2002:a05:6122:3c44:b0:56f:7c7e:f33a with SMTP id
 71dfb90a1353d-57547fd53a0mr1268108e0c.0.1777983476537; Tue, 05 May 2026
 05:17:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428201522.903875-1-cristian.marussi@arm.com> <20260428201522.903875-5-cristian.marussi@arm.com>
In-Reply-To: <20260428201522.903875-5-cristian.marussi@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 May 2026 14:17:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUF1dW0hR-UZMVVqTnpWbMcv1D41jfL_4rEj6Vzj9wGSg@mail.gmail.com>
X-Gm-Features: AVHnY4JwQvUlXCNsMN5caeA9aMIeCzl1Epu5sphmxX2UtNuOS2ulpV9OaCHfntE
Message-ID: <CAMuHMdUF1dW0hR-UZMVVqTnpWbMcv1D41jfL_4rEj6Vzj9wGSg@mail.gmail.com>
Subject: Re: [PATCH v3 04/15] firmware: arm_scmi: Simplify clock rates exposed interface
To: Cristian Marussi <cristian.marussi@arm.com>, sudeep.holla@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, philip.radford@arm.com, 
	james.quinlan@broadcom.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, 
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com, michal.simek@amd.com, 
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cristian, Sudeep,

On Tue, 28 Apr 2026 at 22:16, Cristian Marussi <cristian.marussi@arm.com> wrote:
> Introduce a new internal struct scmi_clock_desc so as to be able to hide,
> in the future, some of the needlessly public fields currently kept inside
> scmi_clock_info, while keeping exposed only the two new min_rate and
> max_rate fields for each clock.
>
> No functional change.
>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks for your patch, which is now commit 83fd9d34b6b75be5 ("firmware:
arm_scmi: Simplify clock rates exposed interface") in scmi/for-linux-next.

> --- a/drivers/firmware/arm_scmi/clock.c
> +++ b/drivers/firmware/arm_scmi/clock.c

> @@ -457,14 +466,14 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
>         flags = le32_to_cpu(r->num_rates_flags);
>         st->num_remaining = NUM_REMAINING(flags);
>         st->num_returned = NUM_RETURNED(flags);
> -       p->clk->rate_discrete = RATE_DISCRETE(flags);

This removes the last setter of scmi_clock_info.rate_discrete.
However, it is still used until the next commit cd73d1bfaa8d34bb
("clk: scmi: Use new simplified per-clock rate properties").
V2 did now have this issue, as the patches were ordered differently
in that series.

After both commits, there are no more users of
scmi_clock_info.rate_discrete, so it can be removed.

> +       p->clkd->rate_discrete = RATE_DISCRETE(flags);
>
>         /* Warn about out of spec replies ... */
> -       if (!p->clk->rate_discrete &&
> +       if (!p->clkd->rate_discrete &&
>             (st->num_returned != 3 || st->num_remaining != 0)) {
>                 dev_warn(p->dev,
>                          "Out-of-spec CLOCK_DESCRIBE_RATES reply for %s - returned:%d remaining:%d rx_len:%zd\n",
> -                        p->clk->name, st->num_returned, st->num_remaining,
> +                        p->clkd->info.name, st->num_returned, st->num_remaining,
>                          st->rx_len);
>
>                 SCMI_QUIRK(clock_rates_triplet_out_of_spec,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
