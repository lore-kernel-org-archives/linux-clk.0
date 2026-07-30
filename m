Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F06F446050
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 17:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433096; cv=none; b=EoYc+WCh/OAOXkdyFZ0KZAYlwoxjgbe3aYw3fpua2ESOBptkrexMFekBFPOkCjJ7EijAnStEMNqppsUQykqT1nsvjLFM8sEkDjUG+Tg1YJJZdEgN7c/3moNpGgQwzAQeR2k9mhrFQukMsOyq8LmQflAPZyMVtOFqpRiYqa1DruM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433096; c=relaxed/simple;
	bh=tcCAaJdWJcVjCNXkGXLQhu11kXbWbdF1H1Q7waoPhQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAwuXx5OetXEx9pRMUBwDL0bEFO/y++d+DQdrI8OYnTyEdfCxlmK/uZZ/cA+Ab7TeovW/8W/yj3j98B9s14df59QAbI3lo+VNVsSXASQeY/E7qOpiaulb885G2Pf1KG7PnlxFUDP84Y0soRaeNeNqwxkSQ2bVd1YzyRDfdWUp8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M3qUsqP8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qmv4/Aed; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M3qUsqP8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qmv4/Aed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785433093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PRVLUAMqt9btSYcKLPYN+Dg017FHNaeUxumso8uAL/U=;
	b=M3qUsqP8UmpFQmYuDNZ5Wlb12fryzpOun/n3qBZTCbJ3qTHMCJM6RwfGH0acb+C9lgADVa
	SOWp3f7/ZyqC+PQ5zj4WA1POBTLREZhYFm8FtPhHUWJzMqBLNyV+kPdP7nBGnhfPmKQYpd
	Iw99FSzBpyNSxivOIwaAPvZ7TgO6rKk=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-vgBoXsgrMbyV5zoGEZGV4w-1; Thu, 30 Jul 2026 13:38:12 -0400
X-MC-Unique: vgBoXsgrMbyV5zoGEZGV4w-1
X-Mimecast-MFC-AGG-ID: vgBoXsgrMbyV5zoGEZGV4w_1785433092
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81e8a76a273so2899707b3.1
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 10:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785433092; x=1786037892; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRVLUAMqt9btSYcKLPYN+Dg017FHNaeUxumso8uAL/U=;
        b=Qmv4/Aedan7hcQz8zdo06qi5nF2HNxgwap8nyZp7bAn8QBUXc3TOzbpUdal1eFiUML
         C0zklhtMi0rR5A4m1KlyOi54aCNThRh8/1nCR0poZuqEpAMZWpI1k/DAz59nd8p+IaMY
         tcDhI1OybMqq/BZhZQAQEUClDgzELJ/OmpAQ7zz1XpJpsyyMRqmE9+HU9O65nNnsBSrH
         BWhkVFtHlc85dNdGdzJX7tyBC+ue+SZOH37guVAEXzPs1KZKGve+ATqOcWuo0ej0lQLC
         PXEBIFcsfmPmaxWRLYgZNRJi9fHbAS5xw681j6aOK0IiCdUBfa5K2YKQ60ft7Ur+VwzO
         OLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433092; x=1786037892;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PRVLUAMqt9btSYcKLPYN+Dg017FHNaeUxumso8uAL/U=;
        b=c6KkNxmxZ25He9yCSqnG45Yd3kaGtUxifH6rfZZoWZdYDAOJWJ3B+U/S+bmKbeqOdX
         58T8EdcvOoJRuaEV/YX3g+5XlWqnDSyblbQCQDJBLa978nRZ2YmgjFBplD/ECYYC97fE
         wM/fuyPJRPGOpICDNMqJfzX4gUjdmM6zDKzu0dZs6C/RzEZyAkaV53q4tAQxp7AL7q/5
         kq1LD1JcCpfbDPPx7i7UR9BhQCFbjTjgBq5WzFewOMcppj98ur4unLcwANwm839xalb2
         qKNeVXCMvL7LmMHqRWefSGcf5mM0C+kaXh7E+p4dCNHh9+SmmXIJq+3j8XG1azDXSrtb
         D5QA==
X-Forwarded-Encrypted: i=1; AHgh+RrBCyWn2N3PQbDnT1jkdnD44hf3HAW+qmS6O28obojaD5dMI6zAjSw0QHmxNOFPoJnIDW9dep9ANow=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfTWVaCaQTb77gBykXVmzwxDUXRItMW9r6lk/mPkF4T4MAsBf7
	wVajsWzKOy+sOWDwTtN21MsBpGRxwNrP2+H4EiGfBhalx6npaBFVlEb2QCrpU2eDBjg/PFOIPVa
	6zNAg4/VVvzXBceVObPbk4otlV0DHUBr3KSlZzZijeHGwaEp2sI4SylRgTZbVKKmEIU1VSQ==
X-Gm-Gg: AR+sD13L0U2LfWbYIRdfXiSePI/X4Xud7MWBQZR086ONs6MKC1hqTYqMBscQddg0whY
	ifQzSBxabCmpm0qORoUOafBORv6YGFTNBLYkjxsYnxrWbBdpFwvE3BpSQycMSLPiRk9jH2e8mUl
	/E31RcPD7s3o+8HJ76OKO+1e20EgD0/MzZmqf8kZjHSG7YqwjITNi/jpfAR1FqdxdBCKqVm96xW
	LCjTGtSs8HVp2++O5VKCzq/7V1h9oikkn0DdHopuibQwLMlVAvkkt10fRzxlWOwwo9m1chJvYlu
	y2vR05r0nGFQZTuCq/dlsQuobMMCjQmNUCm1dbKgASX+w3TZ/yzGbUVdJOS1m3Ydgb5ZFN//N1I
	hOO6dR0fIZtPoNqelpvLDNxjgBTI8Ee56KSI=
X-Received: by 2002:a05:690c:698f:b0:81e:fd36:ff73 with SMTP id 00721157ae682-81fb891d54cmr25018637b3.5.1785433091928;
        Thu, 30 Jul 2026 10:38:11 -0700 (PDT)
X-Received: by 2002:a05:690c:698f:b0:81e:fd36:ff73 with SMTP id 00721157ae682-81fb891d54cmr25018367b3.5.1785433091480;
        Thu, 30 Jul 2026 10:38:11 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb87315cdsm14274757b3.0.2026.07.30.10.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:38:10 -0700 (PDT)
Date: Thu, 30 Jul 2026 13:38:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v8 05/12] clk: zte: Add Clock registration infrastructure
Message-ID: <amuMADxexEuJJG44@redhat.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <amiw7mfPfSPjLHLH@redhat.com>
 <ami0TaY84IslWZyo@redhat.com>
 <MwDLqBgXR7G6dGkTtCaRrQ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MwDLqBgXR7G6dGkTtCaRrQ@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Stefan,

On Wed, Jul 29, 2026 at 12:25:34AM +0300, Stefan Dösinger wrote:
> Thanks for the review!
> 
> Am Dienstag, 28. Juli 2026, 16:53:17 Ostafrikanische Zeit schrieben Sie:
> > Looking into the other patches. There's more mixing of the clk provider
> > calling the clk consumer APIs here. It looks like this just takes a
> > reference and holds them. Would moving to parent_data address this?
> 
> I think so. parent_data::fw_name is indeed something I have been looking for 
> and didn't stumble across myself. And I suspect when you say "use 
> parent_data", you don't mean "use parent_data.name everywhere".
> 
> But it raises the question of how to handle internal clocks, e.g. foo_gate-
> >foo_div->foo_mux->clock-26m. Only "clock-26m" is passed through the DT and 
> found via fw_name, and only foo_gate is exported.
> 
> For the other clocks I currently rely on the string matching to resolve the 
> parent named in the static init data to an actual registered clk_hw. The 
> alternative I see is storing the struct clk_hw * in a table by index and pass 
> it in parent_data.hw, but that'd require managing the extra indices. Or build 
> a clock-local name->clk_hw lookup, but then I am just reinventing the old name 
> matching.
> 
> Am I missing something obvious? Is there a canonical implementation somewhere 
> that implements modern best practices? I learned that looking at existing 
> drivers isn't always a reliable guide.

You'll want to register all of the clocks with the subsystem. Take a
look at drivers/clk/qcom/gcc-sa8775p.c and here's an example I picked
at random that shows how you can reference the parents with the
parent_data:

static const struct clk_parent_data gcc_parent_data_8[] = {
        { .index = DT_BI_TCXO },
        { .hw = &gcc_gpll7.clkr.hw },
        { .index = DT_RXC1_REF_CLK },
        { .hw = &gcc_gpll0_out_even.clkr.hw },
};

static struct clk_rcg2 gcc_emac1_rgmii_clk_src = {
	...
        .clkr.hw.init = &(const struct clk_init_data){
                .name = "gcc_emac1_rgmii_clk_src",
                .parent_data = gcc_parent_data_8,
                .num_parents = ARRAY_SIZE(gcc_parent_data_8),
                .ops = &clk_rcg2_shared_ops,
        },
};      

Brian

