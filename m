Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C583AE1A2
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 13:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773755518; cv=none; b=gxwGk+1KEAt30gL1C3TWA5qXY5fHlaH4sFAZBvVnwjm/XXsY8gzT1vXNlwC393Fc5BL/qtRyaGt2fzcWwRCTEs149J1DT0zoB1ltvgONYwbjCCKQFWArI5kn51cmXemzTu05pjn6vYdJmNtS7L2l9epmAyuFAwouORIqEDjx3EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773755518; c=relaxed/simple;
	bh=Yzm5FSijW0cQ/0Zb8KtjXsfCMLrubeKERrn8lSfDmFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=il47zfUy+H0BSzvennDTHJWHNtas1Ym9UpSN2SeVaHN/eUu/0tvICacaK3y3oSQiZEFls3Oes+wuiyPzSIozPTugD+dl42zmPGfiDnh/1mOg3PjzO9WxBPG5p6ItBLoVnJ9qCpgy5PSzXL+pS/19/csi+HIYeHz4FuYz2TXh3ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXeZ2p5k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=haEPdUYp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXeZ2p5k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="haEPdUYp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HA3JcB2072257
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 13:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rReWAKQt2BQxssE02myl2YtG
	l26c9xhwvv959V1e/zs=; b=cXeZ2p5kmFF6DFS3fzSrUqCySHnJhCKWxfN6Zd9Z
	4/xutomjEKiFcOvItb9uIjSpRY93/QWETxN+BhN0j7pMY7G1PL9pT3/NBwUyDFOO
	QiFU9vJUXDnq7loxd2xCfwNl3d7O0V28itFTi8prMzM2y4yIGnO03Pl3SJ/S+AiK
	XnJqvgL0HpiUGPTfxM4DheRrjezEXIJiwFnhy91L/D66zPlblZsn6uVDSQyR7Jxm
	worZOUuIvWYPoIJY+pukPKoSjSQDSeVihN52d/t2mtpZ0pjbJJcwAGy4BeAQf5LH
	8oZ8//p5LHeu9Mn5EcdQV8xel3VtkpqhEFQni65kyXY9Lw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy4v6rr0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 13:51:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090e08dcfcso63526761cf.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 06:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773755516; x=1774360316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rReWAKQt2BQxssE02myl2YtGl26c9xhwvv959V1e/zs=;
        b=haEPdUYpdnU0sMT4wz9tcgcZ1cBSGJO0diR4DuOwqQdwe6+wP26wcKUImuIrXWTMCB
         g6UZovH2oMPiopcNqF+a2F8fWw0PpZHFu5Fs6X8XTuv96Y2/oPaYCSnpV5EwQTHM94St
         fOkmg6ImyJlMQCxI+sWZ5uYPVVXfsgI8Vq7D9sBFb6ypCj48ZWpKlIZCSSSENQ1ryg6X
         nMRK75DvZJeIjECYZUBrUteWfg3hIgmY5InpWnHMTUcbFN7RrOFdxdJFMCaQZYh1gYEP
         33gfX0jg8oIobFZaW7Rfca03esgxVlc58nbXMVFzl2e/PfFkkS116lFVOWfMdmzh9/9a
         wAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773755516; x=1774360316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rReWAKQt2BQxssE02myl2YtGl26c9xhwvv959V1e/zs=;
        b=JwzxhUtJUEy5gFeOg6Fv+bSI6QltIWQ/Abeb3hiLnLhjI2SBKEILSlDWYoEj4Y1Q+e
         A7AE6YEHjf4d762CRk3VblrXMnqFdlEG9/Y46sdOytaoO6XCzdPmzpDh35aSqgiQ9Emf
         iSTHhT28JEvXXJVvBGbMRi28aOD9yUXrx51oPhLebvpQhWtkqgX9IJX9oo4y/7xDAkoa
         ayE/Hpo5HN1g9M9aSNyohj12gLdJPfgng9TD7uc4Et7QCwnsIxTsyq/JXSWIdBVO1x8o
         rVWQDg8zOp/2p72t4kux716ns5+hs8ZJ1L62QI7wBmYV7CAyk2Qcuep94OMjbMhJksUj
         9B6A==
X-Forwarded-Encrypted: i=1; AJvYcCXcmxJtzHWZy3ZhXQRCYkETkRll8rtI3pUd8YatnzwYSy8fo3X+GmRxEIj9ZD2sQuOur6y/WS4vDL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgduzRp8/aXakGso+IlEZ445aXa45KyvjzjY19APAMX37QahyH
	rwLL4IXfv5QWZ/QKqeii3Q6V+vr72Xz2+kUFe2JdEXLnps4U0mJjBqyUA+rtiXRh6JJm9T0Wdri
	KIq4plrqoVPfuRdfPjNb0OwKLezZHHHHv2OgBugW/OhQ0bbc2NkThDH26Zyr4lUQ=
X-Gm-Gg: ATEYQzxLHURZSl/anC48rl7J2sHBhY9pXGLWvDKw2qhROnnRQDegzTxcixwGgJtqUED
	c/83oiHiKiuc3kj8Mc9HxMey1Ecd+sxOrlefGqmqCk9h2+gocaXUw6PhHB/btNIOTN4xXHsg3Dv
	7IbAMCdgO6m3Cmh35WDEmDyjxF6ZztIM5kKmNXeJ6xj/8sqPTkYu5gbDmjRifGaECMeUI9shNJY
	sSf8BElwF+3hofbe6WQcAq1mVirjd5wILXoo1Kc1YKjeZbx4fL9ZnC4azZH+gxY1DpJZOj4KcXA
	9OIiDpbMx048qsx1gk7/1iasqJjgNQRT3Lcb3FNR/DU7BHeAMCeONX1HctEyVWKxMclILqCOSEW
	l2lYvLfakcuAoQDEW580zxiOhnado5zCDGQ==
X-Received: by 2002:a05:620a:450d:b0:8cd:937f:141a with SMTP id af79cd13be357-8cdb5a17fe4mr2261795985a.6.1773755515473;
        Tue, 17 Mar 2026 06:51:55 -0700 (PDT)
X-Received: by 2002:a05:620a:450d:b0:8cd:937f:141a with SMTP id af79cd13be357-8cdb5a17fe4mr2261788785a.6.1773755514721;
        Tue, 17 Mar 2026 06:51:54 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea9c36bsm72076515e9.9.2026.03.17.06.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:51:53 -0700 (PDT)
Date: Tue, 17 Mar 2026 15:51:52 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <lxam2uqcunbm4plxfvpu7wje4jnkwwsafoddaurcewpdqupdgu@4kagci24bmzt>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <75a9514c-2e62-4535-b963-65a99cdfd3f6@kernel.org>
 <20260317-tough-slim-sunfish-fbe9da@houat>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-tough-slim-sunfish-fbe9da@houat>
X-Proofpoint-ORIG-GUID: hWU8nuzD90IgTKw3qvga0Vae-hqt6Cls
X-Authority-Analysis: v=2.4 cv=Aa683nXG c=1 sm=1 tr=0 ts=69b95c7c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=vTr9H3xdAAAA:8 a=OGjWj8McAAAA:8 a=kkx97xTtIpc6WjRIJjcA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=UYjydHh6ynBBc6_pBLvz:22
X-Proofpoint-GUID: hWU8nuzD90IgTKw3qvga0Vae-hqt6Cls
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyMiBTYWx0ZWRfX7EGGtZ5MLn/6
 j5+LrDdN6jPAqNMr64er7ImJkP+0qGrBoFDunXizSvBqhOCACoKbIg+GKGx7f6yQRFbF5tXBxZ2
 rFxMDwV4d1xXdFT/VFVTxPVYmyO70XuTQIuLSnQZUcFA7W4mtB/uoClT1gdOhR4nHr8AixyIBd7
 pMJu5T0Dh6KFFAi+qGJ6vRjoaFMiNY1fQOpAJWiJc6V6Spmeaai0uY+w6L8ELhsKkylMrqjpCQD
 JdP9I0X08PeqJFElAV3YRGbF4dw/EDrYsWERYQ7UbYhAPIDVu0v6w0oUru2qGor4PUfg+NpGygE
 viYcWA4KTE8c92JLZX2NtF4Zyh7Ze+3JYzCE5RNmiREIi9SNB6FbTBiiURoItOv1zme6W7GQKmV
 I0PHvCjeb1GfDrHkv5gznjaOLAitUvWKMVd4qAR/+2iYA0zU+ouDndkmR028MgmHr6Pe1sk7sIL
 I8hGBJg0jJs3QM735+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170122

On 26-03-17 14:32:47, Maxime Ripard wrote:
> On Tue, Mar 17, 2026 at 12:53:10PM +0100, Hans de Goede wrote:
> > Hi Maxime,
> > 
> > On 17-Mar-26 08:30, Maxime Ripard wrote:
> > > Hi,
> > > 
> > > On Mon, Mar 16, 2026 at 06:33:45PM -0400, Brian Masney wrote:
> > >> At the 2023 Linux Plumbers Conference in Richmond VA, there was a
> > >> discussion about how large number of systems need to boot with
> > >> clk_ignore_unused. Per the discussions at the conference, the existing
> > >> behavior in the clk core is broken, and there is a desire to completely
> > >> remove this functionality.
> > > 
> > > Broken how?
> > > 
> > > clk_ignore_unused is to a point where it's seriously cargo-culted and
> > > documented as a silver bullet, when in reality it's just a debug tool
> > > for broken drivers, and the driver must be fixed.
> > > 
> > > But nobody is actually fixing it.
> > > 
> > > See
> > > https://fedoraproject.org/wiki/Changes/Automatic_DTB_selection_for_aarch64_EFI_systems#How_To_Test
> > > for example. The affected clock could be marked as CLK_IS_CRITICAL, and
> > > fedora wouldn't have to package anything, change anything, etc. But no,
> > > the problem is clk_ignore_unused.
> > 
> > Both things can be true at the same time. Yes there are ways to work
> > around issues causes by clk_ignore_unused and those ways should be
> > used more often. And in example of the X1E laptops I do indeed want
> > to try and figure out which clocks must not be turned off and
> > try to see if it will be accepted to mark these as CLK_IS_CRITICAL.
> > 
> > But at the same time the fundamental concept of turning off all unused
> > clocks as soon as all *builtin* drivers are done probing is a broken
> > concept when working with generic distro kernels where many drivers
> > are modules. To me it looks like this was very much made with
> > embedded systems with device specific kernels where all drivers for
> > the used SoC are builtin.
> 
> It's not about embedded systems, it's about shitty, inconsistent,
> closed-source bootloaders. If bootloaders weren't enabling far more than
> they require and / or if we could fix them when they do, we wouldn't
> have more clocks enabled than we need to.

This argument is wrong. Bootloaders need to leave resources enabled all
the time. Think of every possible peripheral that needs to work until
modules are provided. In fact, I'd argue that the more they leave
enabled the better it is for the boot-up process up until initramfs
comes, even beyond. In fact, the lack of bootloaders leaving stuff
enabled is one of the reasons we build in some of the clock controllers.

> 
> Removing clk_ignore_unused will just make end users pissed off because
> of the higher power draw.

With this I agree.

> 
> > The problem basically is, that if we want something like disabling
> > unused clocks at all (1), it should happen when all drivers including
> > those build as module have had a chance to run. ATM the clocks
> > simply get turned off too soon.
> > 
> > Also see Stephen Boyd's LPC talk about this:
> > 
> > "Make sync_state()/handoff work for the common clk framework"
> > https://lpc.events/event/17/contributions/1432/
> > 
> > When the clk framework maintainer themselves are arguing for
> > replacing the way unused clks are disabled atm with something
> > better then to me that is a clear sign that there is something
> > wrong with the current mechanism.
> 
> I have no problem with *replacing* it with something better. I looked at
> that talk already, tried to make sync_state work already and suggested
> it to Brian too. So I'm not saying it shouldn't replaced.
> 
> What I have a problem with is removing it with no viable alternative in
> sight.

Again, I agree. But moving this to a kernel config is wrong specially
since you want a single kernel image to work with different SoCs from
different vendors.
