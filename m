Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F12488DA6
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 10:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936065; cv=pass; b=AhZwrTEHHwu/w3ucXcS9psl91/aiVEUerlY9d30AGpbXYqRuFystT4UYAaTGh9C+F76zBEd0ySDA/pb4kJ4pj+ESYTPeqPc2B+/sVP3xmpYHV8Rfggltwe0hoXRaLTd9xUAFvKzvd72e6dueI3eH209jKZRKxgiTAz5UJoMuDQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936065; c=relaxed/simple;
	bh=pIfrqYOsttuk4BcoBkatYHzhO60Yrc+sR942QLyGfbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PUAKu0AQkKaLzPV229Z+hoCC8vKeipU2eMKXdgBM22S/GivHNiPp2nJplMGLQ4Ix+vcYtYYEiTacv7UZdQ/ER7hWtyiwBkED45xPI+SsPBhFA27XNkHSeLr/G9J4zFxOotJ+6wJzShtdVgU5sZkOnPI6uJ21pwiY+mBo83MvaLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTt39BcF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iG4GoTEi; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTt39BcF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iG4GoTEi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nYD53935057
	for <linux-clk@vger.kernel.org>; Fri, 2 Oct 2026 10:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	97tQrA8V1fotLtgnaG3+4FcLpgXpr+0ISXkTd+sa8kE=; b=gTt39BcFNLX7ML3w
	MHVGUYozgYrp53m+cIkXudyla3DkkhIDcBC5GOxak74EnUyfrwqDkygihs5f+2rT
	7KksnIswlaRwt4vRFRsaAoIAsT4YQPGzMrQy/3LodEYu3YQmmImVPySOBUSchLRO
	g9PdBZ56v8vt/cBrrRgiPQEzZI22e079byf8h76+Avp9zkKIs1cwe4xhMoZi8XAI
	u/dTdXbFbypyDnL2+8BAz1jxPdLdPokklz1UrkcjiTycrDbOLWQSdBMJ24tdO0JS
	AP7sAlHjKLTp2YLmuJ6SxnySObd1bvrP9HsOYobtQWnNgjb972bA+Mvyo1j3YR7L
	palIzg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxeanvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 10:14:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso2121666a91.1
        for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 03:14:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790936062; cv=none;
        d=google.com; s=arc-20260327;
        b=fBDkqJWK+8Z1Fz1EwA10IPFOJx8La/IguZbUpRuyURowGxbiZ5Bomb0bUBpw3Gl0By
         Y2eB1iEdD3nxJnK5S+2efUozS1Kh0x1s1yMSdP92x33Uel3G0bh6mBu3nCghUzdZeY1u
         AiD6La9AQ7A/U/GpibLettMMZWxFashGI7pqxKFVE9CDH3EXAnhyvqfXUkQg1sBF4gBW
         7WZtM7H49j0d8yRJmWI/kewYUmiL4Z9JTIR68orKq1hmWneSVOtqk7BSTUhS4C2JyNIA
         iuS2nunS7gJMMAtr332yHoD3mG/CFkSVR3aLzNxlALwaKp9zILhmd5ZWJxxue4JHZvvx
         kAEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=97tQrA8V1fotLtgnaG3+4FcLpgXpr+0ISXkTd+sa8kE=;
        fh=AH3KEkX0slt9IqG5A/gohGvqSksT9AyLelNPo8ye0OQ=;
        b=B+Rpqn3e9k+apQnIWnQOMjNiwLX3UVDGZsxScCsJ5CzegROvt5d1pZICOSi3B/fq2v
         gjiNxLYwkM1JZr1tpZeBDI3uN0hD63tuX9w/astZx3Y8fp/pjuibZ1bPONUp/qIOTZcf
         QfYVzVSfLmTARcDql/mIU0OrkSebksN7DjP+akkxim6/jEZAXkQs3a3tzgsvcFm873T2
         LpVuwmjryTWh3zalX57vdn0IRY+XbZST97s9tW9cEa0h/1Lc1dRpJC8YSJj1+Hc15zhb
         ScDeWu6OMLEtrF9N0ZYqp0f9GtDiGfZNG4nCk6HIxQ/9awkY4VUO7ZNPmZ3JSqZQJAQd
         3wcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790936062; x=1791540862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=97tQrA8V1fotLtgnaG3+4FcLpgXpr+0ISXkTd+sa8kE=;
        b=iG4GoTEif4YYbjzxjF4a3F6+l5x07jnfKkHWsv5rMrSaiNFY/fETqaSNIXuG058R4u
         SuXCq/zkuLBE01P3xfuWBqCfWfUVcLv3TJpV4eTRpuGOCc7VdCXvZAH5BwabiAcu+DHc
         sq4MIE5v84aAp6EicOoxU+6+uNg6McLLk+6IPjlST+DYc2g14ZCzdmUOaes/E0DVSXEo
         BlYYETPaQWo8v+U2xh/AicHOg6NBwuViGpFfJ/vDrOVrxcTlq+dXv6TsZhsYZTvNO9hL
         5GK6xpYV5TzbanjCwKHsibicYWnbLSPGvxztvnEeWMoOgOgCjLVtDbFO4yAvBtH3w56t
         Absw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936062; x=1791540862;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=97tQrA8V1fotLtgnaG3+4FcLpgXpr+0ISXkTd+sa8kE=;
        b=0s1YZtHE3myHQ6Ug1LlQv6F4eRK9DE0fzUhbv25gZv4ukAIXWBmFyxv0ZqUQYWBr3b
         KXj6CD9DB58apfspCMxf2smxGUzxIAJFcIvtJUbhXMbGaVGYF4ouXu+crKbg/Vlmb0JL
         17FtEN7YTQV/pHujTh6p4CTIlXoP2WhOuAi3RUMJDgDvFT4OaqZ16BSQsrcYBAQw+nAn
         hR73Bc4SedOP0vCzAysv0z0Bd4TA0696dRGdy0Q3421mbevurM6Nwo5u15AkhvcgUXuK
         jBkzrLyNPkzT2FbTZx3PeRG+ogYyr45GVwSfg6NmI28XwRW/EpP89N8hX/wC+XRN+Ems
         rmrg==
X-Forwarded-Encrypted: i=1; AKwUvBxAgMmgapa/asI6lZ3WOPICqs1H2k1U/IbLGe7soWbxVu/N0fKQThXT29zE8vGBR47VEdC9/PlJfqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9sBrEeYzIiaFmISo+/CmSBUWUDQA5AKXrfk397v8QlBqegd2C
	m3lSDAb8xhsQGrgwo89fF+8TnvCphg0JMqXrm+TUrDO06OSwfxTytIB3ksOmvTD7Ek4MDJZ2n8S
	bRAiFIF8wdLEg4sbLlLU5BqM2i/idin9fFElNB4xRfBOPbW8aiovCeuz5LV/dU+TBPgMhWWbU71
	M6Jxa4XbW3XirPGjMkSykmYJJ3Aix6i2iWgvSZGg==
X-Gm-Gg: AYBFou1bBIVpYTnVVybSV0a16NLT7OukQ6tCscPuocTdVUE4H7nJQW15BXkjNA+jlLX
	h+VGbBzD0gJSIpaVh4H8vsF+uPkhTsc6Q6CCejAQvSqYIqR95+yVRZyjx24gwLiKy7nfJ8ULecq
	XNyR8rxtTVRbuoJ1hy/0bRtSiyRXLgeS2CCl7ejl0gaCW/m6+i3MoMh9k4nw==
X-Received: by 2002:a17:90a:fc50:b0:3a0:25f0:d8a0 with SMTP id 98e67ed59e1d1-3a4f3d3b4e0mr3834200a91.55.1790936061766;
        Fri, 02 Oct 2026 03:14:21 -0700 (PDT)
X-Received: by 2002:a17:90a:fc50:b0:3a0:25f0:d8a0 with SMTP id
 98e67ed59e1d1-3a4f3d3b4e0mr3834178a91.55.1790936061253; Fri, 02 Oct 2026
 03:14:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
 <20260626-clk-sync-state-v1-1-4156d8196dc8@redhat.com> <CACRMN=dAxriWU7Age3g9o_d6zyz8hj2p76vHXJSs7sCFxSwuWw@mail.gmail.com>
In-Reply-To: <CACRMN=dAxriWU7Age3g9o_d6zyz8hj2p76vHXJSs7sCFxSwuWw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 12:14:09 +0200
X-Gm-Features: AclHuK-oEMz6OlcHzwlSg3p_f2RJdDM8dmJ8MqNGv6f5-pC6qfJBs-GdohGXbU8
Message-ID: <CAPx+jO_byttA+b-Z+zNyPa0-zXvjCU8hv_AsSjCmBDWEEkSE0A@mail.gmail.com>
Subject: Re: [PATCH 1/4] driver: core: introduce dev_add_sync_state()
To: Saravana Kannan <saravanak@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Xuyang Dong <dongxuyang@eswincomputing.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Maxime Ripard <mripard@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abf83fe cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8
 a=aupEIk04F7la7JYrT74A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: uuSApR8hFqG9wZwzZP5hG0bT3O0vpIRA
X-Proofpoint-ORIG-GUID: uuSApR8hFqG9wZwzZP5hG0bT3O0vpIRA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0MCBTYWx0ZWRfX1FoCBQktRN6J
 KH91a6ktsXWL7jZVpGna36GjNuxr2STIQfKKZa4jVn4dYPSOlN8gCTmcHCfv1sLAG+4mzhDOJaC
 oa30aCv7I4U+NjTURCSKSSUObA8AHW2kSRjTHIIFzYOQxjJhWAJg9SOFRtyY1v9JQWsNWssqKGk
 hwS0iDaZEfxqmfFBWbtIGfJqEiBgE66QkIfVaYiBxU74mFZtb2FgWsoS8BvnEWyJAiqYVeOsPRx
 M5kuBRzuGTEyGo96MHgEuSCEVvlIgYK4UM4Qb5BTtkAGOdcHD5X+TCIR4SH7SN9PGxK+jEqA0Y6
 F+xEB4Op+0taEPwZcmmwuEYi/WZOoklAhIhrZI8Y4q1eGr0bj+Ik0QUAuQABhdYPETttL5+avwX
 1hXd9FZ1AlDWXTU3IzlPw2RaVMahH0s1iyeJIs+QPsB08hcWj0/rj8mA+H8/9jLiDxx38Db0+nR
 sMlLnWmrtk+9VmqntIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0MCBTYWx0ZWRfX6xQe1NjORYxB
 60n9v8LaY8EdnXl+8gn6gQWOIojBo1JzJQuh11Zwc07cqO2sKOtcFwfNDqJ+RjoZQNGTWzD0U0A
 PR97f1Ht4ilBoMz4dd+L1a2JP1IcElY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020040

On Thu, Sep 24, 2026 at 9:30=E2=80=AFAM Saravana Kannan <saravanak@kernel.o=
rg> wrote:
>
> On Fri, Jun 26, 2026 at 9:33=E2=80=AFAM Brian Masney <bmasney@redhat.com>=
 wrote:
> >
> > We have cases where a device node represents a provider for multiple
> > types of resources, like clocks, power-domains, resets, etc. We
> > currently have dev_set_drv_sync_state() where a framework or driver
> > can set the sync_state callback for a device node, however it currently
> > only supports a single sync_state callback.
> >
> > The pmdomain subsystem currently sets up a sync_state callback in the
> > core framework, and the clk subsystem will setup it's own separate
> > sync_state callback in the core framework. These can collide with each
> > other on some types of devices that have multiple types of resources.
> > Additionally, some clk drivers already have their own separate
> > sync_state callback already defined.
> >
> > Let's introduce support for allowing drivers and frameworks to add thei=
r
> > own sync_state callback via a new function dev_add_sync_state() so that
> > multiple sync_state callbacks can coexist.
>
> I had already thought about this scenario when I implemented the
> framework. Your driver should just set its sync_state() callback and
> that my_drv_sync_state() will simply call the sync state helper
> functions provided by the relevant frameworks.

That would work, but would require all drivers to assign the
->sync_state() callbacks themselves. The core of each subsystem will
therefore not be able to help much, except for providing the helper
functions.

I can imagine a lot of boilerplate code, but perhaps the flexibility
is worth it.

Also note that, we need to address the situation where a child node
acts as the provider, but doesn't have a populated device for it.

>
> This link list is adding a lot of code without any clear benefit. And
> it also doesn't work for drivers that might care for a particular
> sequence of framework sync_state() callbacks. Instead your are forced
> to follow whatever order in which the frameworks are adding the sync
> state callbacks to your device.

Right, if the order is important, the "parent" driver would need to
control the order for how providers are registered. Yet, I think they
already need to do that (if it's important), although for other
reasons.

>
> I don't think this patch is a good idea.

You may very well be right, but I think we need to discuss it a bit
more. Let's chat at LPC next week.

>
> -Saravana

Kind regards
Uffe

>
> >
> > Link: https://lore.kernel.org/linux-clk/CAPx+jO9JiV16ePLk59hTQzEMnA96Va=
6Ns4jqJbwyZ6oTT0AjXA@mail.gmail.com/
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > Assisted-by: Claude:claude-opus-4-6
> > ---
> >  drivers/base/base.h    |  7 +++++++
> >  drivers/base/core.c    | 29 +++++++++++++++++++++++++++++
> >  include/linux/device.h | 11 +++++++++++
> >  3 files changed, 47 insertions(+)
> >
> > diff --git a/drivers/base/base.h b/drivers/base/base.h
> > index a5b7abc10ff0..339db4afbeb4 100644
> > --- a/drivers/base/base.h
> > +++ b/drivers/base/base.h
> > @@ -178,6 +178,8 @@ static inline bool dev_has_sync_state(struct device=
 *dev)
> >
> >         if (!dev)
> >                 return false;
> > +       if (!list_empty(&dev->sync_state_list))
> > +               return true;
> >         drv =3D READ_ONCE(dev->driver);
> >         if (drv && drv->sync_state)
> >                 return true;
> > @@ -188,10 +190,15 @@ static inline bool dev_has_sync_state(struct devi=
ce *dev)
> >
> >  static inline void dev_sync_state(struct device *dev)
> >  {
> > +       struct sync_state_entry *entry;
> > +
> >         if (dev->bus->sync_state)
> >                 dev->bus->sync_state(dev);
> >         else if (dev->driver && dev->driver->sync_state)
> >                 dev->driver->sync_state(dev);
> > +
> > +       list_for_each_entry(entry, &dev->sync_state_list, node)
> > +               entry->fn(dev);
> >  }
> >
> >  int driver_add_groups(const struct device_driver *drv,
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index 4d026682944f..acc12f402dd3 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -2612,6 +2612,7 @@ EXPORT_SYMBOL_GPL(device_show_string);
> >  static void device_release(struct kobject *kobj)
> >  {
> >         struct device *dev =3D kobj_to_dev(kobj);
> > +       struct sync_state_entry *entry, *tmp;
> >         struct device_private *p =3D dev->p;
> >
> >         /*
> > @@ -2625,6 +2626,11 @@ static void device_release(struct kobject *kobj)
> >          */
> >         devres_release_all(dev);
> >
> > +       list_for_each_entry_safe(entry, tmp, &dev->sync_state_list, nod=
e) {
> > +               list_del(&entry->node);
> > +               kfree(entry);
> > +       }
> > +
> >         kfree(dev->dma_range_map);
> >         kfree(dev->driver_override.name);
> >
> > @@ -3239,12 +3245,35 @@ void device_initialize(struct device *dev)
> >         INIT_LIST_HEAD(&dev->links.consumers);
> >         INIT_LIST_HEAD(&dev->links.suppliers);
> >         INIT_LIST_HEAD(&dev->links.defer_sync);
> > +       INIT_LIST_HEAD(&dev->sync_state_list);
> >         dev->links.status =3D DL_DEV_NO_DRIVER;
> >         dev_assign_dma_coherent(dev, dma_default_coherent);
> >         swiotlb_dev_init(dev);
> >  }
> >  EXPORT_SYMBOL_GPL(device_initialize);
> >
> > +int dev_add_sync_state(struct device *dev,
> > +                          void (*fn)(struct device *dev))
> > +{
> > +       struct sync_state_entry *entry;
> > +
> > +       if (!dev || !dev->driver)
> > +               return 0;
> > +
> > +       list_for_each_entry(entry, &dev->sync_state_list, node)
> > +               if (entry->fn =3D=3D fn)
> > +                       return 0;
> > +
> > +       entry =3D kmalloc_obj(*entry);
> > +       if (!entry)
> > +               return -ENOMEM;
> > +
> > +       entry->fn =3D fn;
> > +       list_add_tail(&entry->node, &dev->sync_state_list);
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(dev_add_sync_state);
> > +
> >  struct kobject *virtual_device_parent(void)
> >  {
> >         static struct kobject *virtual_dir =3D NULL;
> > diff --git a/include/linux/device.h b/include/linux/device.h
> > index 7b2baffdd2f5..b7a3dd4b56ed 100644
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -642,6 +642,8 @@ enum struct_device_flags {
> >   * @driver_override: Driver name to force a match.  Do not touch direc=
tly; use
> >   *                  device_set_driver_override() instead.
> >   * @links:     Links to suppliers and consumers of this device.
> > + * @sync_state_list: List of sync_state callbacks added by subsystem
> > + *             frameworks (e.g. clk, genpd) via dev_add_sync_state().
> >   * @power:     For device power management.
> >   *             See Documentation/driver-api/pm/devices.rst for details=
.
> >   * @pm_domain: Provide callbacks that are executed during system suspe=
nd,
> > @@ -723,6 +725,7 @@ struct device {
> >                                          */
> >
> >         struct dev_links_info   links;
> > +       struct list_head        sync_state_list;
> >         struct dev_pm_info      power;
> >         struct dev_pm_domain    *pm_domain;
> >
> > @@ -1137,6 +1140,14 @@ static inline int dev_set_drv_sync_state(struct =
device *dev,
> >         return 0;
> >  }
> >
> > +struct sync_state_entry {
> > +       struct list_head        node;
> > +       void                    (*fn)(struct device *dev);
> > +};
> > +
> > +int dev_add_sync_state(struct device *dev,
> > +                          void (*fn)(struct device *dev));
> > +
> >  static inline void dev_set_removable(struct device *dev,
> >                                      enum device_removable removable)
> >  {
> >
> > --
> > 2.54.0
> >
