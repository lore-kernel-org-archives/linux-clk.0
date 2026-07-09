Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9BB401A02
	for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2026 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590601; cv=none; b=gimYJ93YzRDj5FZJYqbBxSE+LnAFUvGbG0GgcfKBt++XVGsOxL0p7jmDGLYsahXcFflQpE8h6QmN4NhgibSK8Eu1B6DUnTj7jDhWFZQvLy2Xe+bzQOf5LYUXMHlJIuowtpuzClcht8/vzmKLDSK7eEvv3NgxmCq4C3K+PQNI+2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590601; c=relaxed/simple;
	bh=XyB0QJBI/ArxNnxn06+fFpma6hNeLNHAjblX5FcA1C0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bc7ZkyarQ0pCkSN/4Tfxl4+D36EFYW5bIAOkk+8NbrI7nnWQvDq8Bo16mKGYwmk+1Zg5ICK1/PwPSg/AGUCqPhpCfHyiwoYpFLRGXkGiaFbzRVxyQHDo3VdNBSgpr4JXiWt5t4aea0n67KzDNQysg3ZgczlQIcO6CfbOoqRd+7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-738bcf9a573so532893137.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 02:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783590593; x=1784195393;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JBx1Lwl28bs84XHLARf2PZgvr/qdRO+0Qc3qcd6uTMQ=;
        b=PKzPxr8lWn4VrmY12Yyh+52xeQlObROm6PDiFTyLDoEg8Q5w1V449dc86R9mWfy4yc
         unccKKhG3+2Qurn+48So1L9G6FtXcQAkC/owOKKQ61vdMkDrxjZv0W36aZSB48rb80pE
         R9iBEyYZKGGvqot5ENoS09rmTr5m02fS4FBrJC9NIXyRGG9+Hoq+zArOWsv1U8EusgUP
         ppQqjhpJcbAY3V6H5NK4FRQafK/BazHZdti8WpW3zAywiWTwg+9WyoDZImz/4+xZa/lW
         KlvrvftzumTu4DaOLIudACoJs1HeFdox1w+42ob1gNKS0ymq870toPRRKR1Z1ByKPhsP
         RuHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5zdpgMVmXgQ/tjwwcIzirEqGN/1QjwwKIyQQUyu1uKrBR9947ib8pK5YGCA4qiCUkCfckXh8RZrI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyxBe08kolypk84TahBBz1ftNiNv4DLkKGZ4ZwmpzSZDZybG7L
	/6nEKKBZygJSIbXdU4vvA36WLQaQR02cju4NjUm3DB96xYU8Cu0tPUZoeZLFjdoMJgA=
X-Gm-Gg: AfdE7cl0BJ6mQZrAb0kEnwcpZ5Sf7hzzqMl6pWYZQqHGfPVhKWvsFyJOWqlTe797Ba2
	HZ12bZ8o7T/3HW+qlNa6I9KLLfP1csPF17YR91XhBPQ6Il20qHN4gLfS/ER/lFi8u5Zwo2xwfIp
	GZGsUsn5SKqKjYn6ZOUgU26Rj8OgdF01YnUJ6Gve0EL94zzyxqCLJr38eMNIg75gzCqTFpInGFT
	Rrofij8SUc6TSguTP34ftAQ7wbsAuAthP0F0msSM393wFbzYxHYCDXxVXI1KYfay8aFXc+jnu+E
	bZSn91Q4+2LdinqsLYlzJ79r3u3lwS4S79bXAAHNJw699OBcD9i4dMcZiqknI7YvCBeVJekALPp
	sOxdpiRFLLRl0SnDQxJBRBs3bD5fDwFN0qrJx+fRVAqvUSTjXirIluCnx3p5SSZqrZsSHIZq1O7
	4sqM/nRPEhPKIXw4Y8w87GwgdnZezltHoPAc3ZvLQVd8TmaFwY7agWccNsgB4D
X-Received: by 2002:a05:6102:1607:b0:631:28c1:154c with SMTP id ada2fe7eead31-744dff3ab04mr4449009137.9.1783590593464;
        Thu, 09 Jul 2026 02:49:53 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-970e6076dedsm194926241.3.2026.07.09.02.49.52
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 02:49:53 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-969524c1aefso424268241.3
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 02:49:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoMdwzEmFkyvWi2EVG461b9+j0oNhhl7joWRX76CiazRjIM90D4izlMUWc5w6QxGCEsgNpooiyoZTw=@vger.kernel.org
X-Received: by 2002:a05:6102:c54:b0:740:22ba:8a4e with SMTP id
 ada2fe7eead31-744dfed12b0mr3967593137.6.1783590592726; Thu, 09 Jul 2026
 02:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <50f5804f00c55cd60604d00da1bf1f1dc912ba8d.1783505142.git.geert+renesas@glider.be>
 <80a31a21-9876-48a7-a9ed-baac4f87bc11@mailbox.org>
In-Reply-To: <80a31a21-9876-48a7-a9ed-baac4f87bc11@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 11:49:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+nHe9kWbBv1k=b-6iixBBJbqeNY-Vq+qbT+wD2g6jUQ@mail.gmail.com>
X-Gm-Features: AUfX_mz8czD0BjSvqmftRZ_pTGys7GO-j5nSESdQS6eSA4Z7r12bLxvVFtqIaAw
Message-ID: <CAMuHMdV+nHe9kWbBv1k=b-6iixBBJbqeNY-Vq+qbT+wD2g6jUQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] clk: renesas: Add R-Car X5H CPG driver
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 8 Jul 2026 at 23:55, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/8/26 12:15 PM, Geert Uytterhoeven wrote:
> > +static int register_fixed_clks(struct r8a78000_cpg_priv *priv)
> > +{
> > +     struct device *dev = priv->dev;
> > +     unsigned long rate;
> > +     struct clk_hw *hw;
> > +     const char *name;
> > +
> > +     for (unsigned int i = 0; i < ARRAY_SIZE(fixed_clk_rates); i++) {
> > +             rate = fixed_clk_rates[i];
> > +             name = devm_kasprintf(dev, GFP_KERNEL, "cpg-%lu", rate);
> > +             if (!name)
> > +                     return -ENOMEM;
> > +
> > +             hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
>
> Would it be viable to use devm_clk_hw_register_fixed_rate() here ?

Yes, I think so; thanks!

> > +             if (IS_ERR(hw)) {
> > +                     while (i-- > 0)
> > +                             clk_hw_unregister_fixed_rate(priv->fixed_hws[i]);
> > +                     return PTR_ERR(hw);
> > +             }
> > +
> > +             priv->fixed_hws[i] = hw;
> > +     }
> > +
> > +     return devm_add_action_or_reset(dev, unregister_fixed_clks, priv);

And then this, and unregister_fixed_clks() can go, and
r8a78000_cpg_priv.fixed_hws[] is no longer needed after probe.

> > +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
