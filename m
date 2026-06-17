Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC5E477992
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 15:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708550; cv=none; b=gzOXDqqDVPEXnTp8THNQ5pwZ1gv5+1uLP/Tg9toRO2Yyv6ekf4lLdDcVuSmYuPozGC5VNjJMBGpDdjGnuWfI9VG/stC7+OwAcQkyzj/bMaMHjxcNaxP1FDBpvnKSg/m/UryEcLlL3w2E3dc2i+cwj1oWq+t5y5c8yCaxhi0l/Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708550; c=relaxed/simple;
	bh=8uF65UMAky/mRqezH5Mq9Osuw3mDn+nryfOv7IcT948=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEHq2qDu1E5+jimlwmB7fvYdKhCVjaLSnQ0gQL1r0xdGMmsmietJk7dZ9KVDWtcVPTTFbkUCiwA1zPPYQe4a2pu7lID1Fdn6cRF+gEA5FPhNP6uzlTjfCDUt0hUQPqKsmtBXtmXPW4Gmin6HR7hvFySmvezugKnZjzOYDk1aQ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hMEqEB/u; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZHizLDJ7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hMEqEB/u";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZHizLDJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781708547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3L0tfIfv3PgCCoHaDg/lriUnjs9nlO3WVhTB3T6ZruU=;
	b=hMEqEB/ugmy18NDuHyzGGq71tw/ggNoE5FoGUz60R8Ymwb/i2qd7WHGtxxWz1trx7Qr1mg
	b4X4FgLl1Ev7/xgQWTi2NybgPQ+VeeXoOo2q9jjQVaMS2jPYkcZnNEXE/esSx02W5otw8n
	PtA9LNKXQrQXXM53uXUCEPUPv5eqQXA=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-RmoIFvbaNvG_CEiceDErWA-1; Wed, 17 Jun 2026 11:02:26 -0400
X-MC-Unique: RmoIFvbaNvG_CEiceDErWA-1
X-Mimecast-MFC-AGG-ID: RmoIFvbaNvG_CEiceDErWA_1781708545
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-69e96638382so4894561eaf.3
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 08:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781708545; x=1782313345; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3L0tfIfv3PgCCoHaDg/lriUnjs9nlO3WVhTB3T6ZruU=;
        b=ZHizLDJ70d3TNcXjlcoqTp9gzvyZ/k+yWjY8ROo2OCyB0Y9Oa5UCHQ94dST8+QY2ib
         EMQHE2KgpKXH13+xKKxW6pfxPkRcgK8sc033l8f4e5Tv3lMpKagbhgY4gJ5y4DAvLpKV
         QoGmpc39HsnlJuXfynXz1AIGz6v393njtXbOd2ycVw+9FHnBjUghRb184pKhSNlrCYOP
         TDvL4Ki+1KWe1EFK2AZGgAQpjTqqH2HqhOI9rLt5qQ1zQRND1A7IpdkfD67QnOtxKXUw
         M8ntnp5ryUOGYW7CqAqowmvimtsiJF8Dc6ZRcFOfEKn3mm1A38IMhCc33BIdbvCp4x88
         a+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708545; x=1782313345;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3L0tfIfv3PgCCoHaDg/lriUnjs9nlO3WVhTB3T6ZruU=;
        b=irV83UsGzHQfn4aeOT7Qt4pT9FPdFmDXoCyQ1O3G+siAeRgJg1Ay9sLrZHOyE3erpo
         rUltJ+Oqe9Nswp5imsMwMuPNIvZJZx1tRXzbdTpGn2NLxAgmvn4QKUyNBGbUhuWBFXo+
         lmv7U/YjNdGM+jBMf/0MALM2m7WRf+jJrGCDa9iU5TvzjEdiAEQm3QvSh2zjJbugqfpi
         /JFoKAeOircv6VOV3y3+oKb9nkHMVi1d22F9HuWX0bwfCQFsE6Wz3UIUtv5gT7RZPHm3
         epKy13xHKGvI+zv1gJLmHK1u7i8YbVj1M0+tkZr+JR7bqeX83ni6tLtfGca3F6owB5mg
         qFsg==
X-Forwarded-Encrypted: i=1; AFNElJ8K1ozkxoi2KmFYRPrunLSXACsZzzKZemzgCVyVEDHY4YFX20p1udH5XFz1i9OZGPXNA+OyU3yusEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTixCHPbUXNtsN73VQ8QK4WXDdbOREToAFoM27BLqq3faSZKV2
	tbMSwDCzqpMHWUhPeXO234jvlV1iYvAF3q1lt6eH2fvNNIq0sCwD9els1ZkXxFU7uUeG9ceYAwo
	J70dtrqV9VFJLOfFCrXpHLhk0YoyoRFTFsIymv1lIYNRG/I0NdV31RP3KMQkNkQ==
X-Gm-Gg: Acq92OFOnR6q9Cump4ASLh+FxhsFrPp/fpL4iLCVw4vqd5g3EMkQEDJelRNkGJFoXJ4
	Vq1f0QCDa9UhJMIcN0pjlN2WKb+bLQbdT+PZBgHrnqWsoGL/PISPksfl8HRa5ytIoBUyIX+A01m
	Sggps7wXisjqNSWrsIEVBn/mLXj71bk9oP0I20JSw73EfJs2cnKylKM+qGg45jV41tMXj5CFghW
	CmE/O2nCCNF/T4U4hUgdQJic2G7QIkW5ta0nSvO/FyWUFDysV74WlLZulv07jo8xKMm7EvRvnDK
	5BkrfFqHas2x3+/tkkbpj0Ur5MBany0r93i+4kk8MSlwyNk1VnRHiLm84+Z6dh5/xT+IO5qqavZ
	4qrPmaw7f
X-Received: by 2002:a05:6820:2d08:b0:69e:3741:541b with SMTP id 006d021491bc7-6a0b63c3630mr2547635eaf.51.1781708545173;
        Wed, 17 Jun 2026 08:02:25 -0700 (PDT)
X-Received: by 2002:a05:6820:2d08:b0:69e:3741:541b with SMTP id 006d021491bc7-6a0b63c3630mr2547492eaf.51.1781708544318;
        Wed, 17 Jun 2026 08:02:24 -0700 (PDT)
Received: from redhat.com ([2600:382:770d:a626:c01:aa81:bd3c:9c5d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f132183bsm69910286d6.5.2026.06.17.08.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:02:17 -0700 (PDT)
Date: Wed, 17 Jun 2026 11:02:13 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bjorn Andersson <andersson@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: Re: [PATCH v2 5/5] clk: implement sync_state support
Message-ID: <ajK29WcueJ1wLCLQ@redhat.com>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
 <20260616-clk-sync-state-v2-5-15f82c64d95c@redhat.com>
 <CAPx+jO9JiV16ePLk59hTQzEMnA96Va6Ns4jqJbwyZ6oTT0AjXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPx+jO9JiV16ePLk59hTQzEMnA96Va6Ns4jqJbwyZ6oTT0AjXA@mail.gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Ulf,

On Wed, Jun 17, 2026 at 04:24:05PM +0200, Ulf Hansson wrote:
> On Tue, Jun 16, 2026 at 11:09 PM Brian Masney <bmasney@redhat.com> wrote:
> >
> > The existing support for disabling unused clks runs in the late initcall
> > stage, and it has been known for a long time that this is broken since
> > it runs too early in the boot up process. It doesn't work for kernel
> > modules, and it also doesn't work if all of the consumers haven't fully
> > probed yet. Folks have long recommended to boot certain platforms with
> > clk_ignore_unused to work around issues with disabling unused clks.
> >
> > Let's go ahead and add a framework-level sync_state callback for the clk
> > subsystem. If a driver doesn't have a sync_state callback configured,
> > which is the 99+% use case today, then let's set it up to use the
> > clk_sync_state() introduced in this commit so that no driver changes
> > are needed.
> >
> > At the time of this writing, there are currently only 7 clk drivers that
> > implement sync_state, and all are Qualcomm SoCs where they interact with
> > the interconnect framework via icc_sync_state(). A shared helper has
> > been created for this platform that calls clk_sync_state(). It is
> > expected that any new clk drivers that want to implement their own
> > sync_state will also need to call clk_sync_state() at the end of their
> > custom sync_state callback.
> >
> > There will be several stages of disabling unused clks:
> >
> > - The first phase will be executed at late_initcall and it will only
> >   disable unused clks that do not have a struct dev.
> > - The sync_state callback will be invoked for each clk driver once all
> >   consumers have probed.
> >
> > This is based on previous attempts by Saravana Kannan and Abel Vesa
> > that are linked below.
> >
> > This change was tested on a Thinkpad x13s laptop.
> >
> >     [    0.308051] clk: Disabling unused clocks not associated with a device
> >     [    6.541069] qcom_aoss_qmp c300000.power-management: clk: Disabling unused clocks
> >     [    6.843310] qcom-qmp-pcie-phy 1c24000.phy: clk: Disabling unused clocks
> >     [    7.604556] qcom-qmp-pcie-phy 1c14000.phy: clk: Disabling unused clocks
> >     [    8.446161] qcom-qmp-usb-phy 88f1000.phy: clk: Disabling unused clocks
> >     [    8.446293] qcom-qmp-usb-phy 88ef000.phy: clk: Disabling unused clocks
> >     [    8.546067] qcom-qmp-combo-phy 88eb000.phy: clk: Disabling unused clocks
> >     [    8.546203] qcom-qmp-combo-phy 8903000.phy: clk: Disabling unused clocks
> >     [    8.546254] qcom-edp-phy aec5a00.phy: clk: Disabling unused clocks
> >     [   15.436834] qcom-cpufreq-hw 18591000.cpufreq: clk: Disabling unused clocks
> >     [   15.436953] clk-rpmh 18200000.rsc:clock-controller: clk: Disabling unused clocks
> >     [   15.723348] qcom-qmp-pcie-phy 1c06000.phy: clk: Disabling unused clocks
> >     [   21.063241] q6prm-lpass-clock 3000000.remoteproc:glink-edge:gpr:service@2:clock-controller: clk: Disabling unused clocks
> >     [   21.081996] va_macro 3370000.codec: clk: Disabling unused clocks
> >     [   21.092740] rx_macro 3200000.rxmacro: clk: Disabling unused clocks
> >     [   21.118261] wsa_macro 3240000.codec: clk: Disabling unused clocks
> >     [   21.128758] tx_macro 3220000.txmacro: clk: Disabling unused clocks
> >
> > Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > Link: https://www.youtube.com/watch?v=tXYzM8yLIQA
> > Link: https://lore.kernel.org/all/20210407034456.516204-1-saravanak@google.com/
> > Link: https://lore.kernel.org/all/20221227204528.1899863-1-abel.vesa@linaro.org/
> 
> For future revisions, please add ulfh@kernel.org on to/cc.
> 
> > ---
> >  drivers/clk/clk.c | 72 +++++++++++++++++++++++++++++++++++++++++++++----------
> >  1 file changed, 59 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 9cb2b42d1be4..7a15cceec620 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> 
> [...]
> 
> >  void clk_sync_state(struct device *dev)
> >  {
> > -       /* Will fill in */
> > +       __clk_disable_unused(dev);
> >  }
> >  EXPORT_SYMBOL_GPL(clk_sync_state);
> >
> > @@ -4345,8 +4382,17 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
> >         core->dev = dev;
> >         clk_pm_runtime_init(core);
> >         core->of_node = np;
> > -       if (dev && dev->driver)
> > +       if (dev && dev->driver) {
> >                 core->owner = dev->driver->owner;
> > +
> > +               /*
> > +                * If a clk provider sets their own sync_state, then it needs to
> > +                * also call clk_sync_state(). dev_set_drv_sync_state() won't
> > +                * overwrite the sync_state callback, and this call will fail
> > +                * with -EBUSY.
> > +                */
> > +               dev_set_drv_sync_state(dev, clk_sync_state);
> 
> We have cases where a device node represents a provider for multiple
> types of resources, like clocks, power-domains (genpds), resets, etc,
> as in the qcom case, for example.
> 
> For power-domain provider drivers (genpd) we also try to assign the
> ->sync_state() callback, see of_genpd_add_provider_simple() and
> of_genpd_add_provider_simple(). This means the above doesn't play well
> with how genpd behaves, so we need to figure out a way to manage these
> cases.
> 
> In this regard, we also have of_genpd_sync_state(), which allows a
> genpd provider driver to explicitly call genpd's sync state function,
> if/when needed.
> 
> Unfortunately I am not able to suggest a detailed solution for how to
> move this forward at this point, as it requires some more thinking and
> I am heading for some vacation very soon.

One approach I initially considered was to make it so that we can have a
list of sync_state callbacks that can be added to. I already did some
work on this, but I didn't think it was worth it for just the QC clk
drivers in isolation, but it would address the concern here.

Brian

