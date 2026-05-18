Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698E53CCFCA
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 06:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779087510; cv=none; b=L8QJCyK0Hk425ZZ5dYWz0TGOkA+tEH8yiBCBfS+SkEBra3Ggqb6xOLp+Sc6COV7ACJMFlY/FekCq684EPlT6+wYHjmJr4OtM9TNpTdA/H6Z9GgjxoxsZiYsFCp5SmKb1dl331nUmqD88+GXe7uazqgqJHLu3/36EcVypMk8FnrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779087510; c=relaxed/simple;
	bh=ckpbqgs5shqJPvCBzMZPnwjiNzzYTA3QidB3KHAt51U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqrTROpObgARctfTzh4eD3D40eT/nmZ0GD75Oz4fbyUyGCwfjheEz3HFb3O9y2NO0OeJiUMGYJz9w1AnKzHIHZ9LTesnR47heHhM+JNePCtv1xlUftISOxuAAldAXiiLlAyRqUC89duL43YhywN+BMF1ykbs9Mqo9SrM8MiPl1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g7nlHgDu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aMp9tbtL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7nlHgDu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aMp9tbtL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I5enpX1255259
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 06:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BNm0P/bZjFz50FHQ/dGvilOp
	pAsbdM8goRfGTDaWVD0=; b=g7nlHgDuv4DoaJItVPkAN7izhmqHDWExDMqkusZ6
	+oqh5uRTL7mDem2MD6z7a+lpUc7KnCWU1x7EbVF3XUQZo0e5aZgNpSRF5n2peHub
	YGj21uooHZSFUA68f9qCAJNq0zxM02N00XDO0c4b9Cd1GAvWjctESjGUDyKyrT8B
	MtF9h1/E4icY74Oxv3sVTHy0iEXlAYZxbdOWZGWWsORuxuPr63tZM2EgJh0IcmWW
	D3KkxmGOx3/Ux8ucDkuquwrYPzVLbAa4U47QljHwZYSybQ+a5bim3W4XmUrSh86o
	p/VdVUhz/U58aThViaa8RY8wLN4x/I/Who8JTW/eLgAkKw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvckx5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 06:58:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-515224a8aa0so14697951cf.0
        for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 23:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779087507; x=1779692307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BNm0P/bZjFz50FHQ/dGvilOppAsbdM8goRfGTDaWVD0=;
        b=aMp9tbtLzEcTHrqdKFQNZX1s0a7xs5Tj7y3uJEWi67NOgSOP1D/WDtov2DmReRZAeC
         kAEj34zOBEC/dKbj8+oXyKJbt2r8RbYRTZG4AZ2B21DbA66CMo4CGsp6yYpJhJGLYMqu
         44lbZYyqWNP7RmCpdAPxzEQLQXeYOEeA/xH8T7If8ej8zFNU/UfFmWDpNCSWmgrzlwey
         /WCtqhm0WcgwXFCmrhyHEAXmJK0ZWhwVwhNeCeda94l3y1yCMcUPpxQemQmFPh2R2hLi
         ESQoK3PdBrZMrfSxw3Soq2vWEOXq7uDxnjaXuEyby/hF5Aaj2+nsFu9CyZJGGh9D8vuB
         ZKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779087507; x=1779692307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNm0P/bZjFz50FHQ/dGvilOppAsbdM8goRfGTDaWVD0=;
        b=PsQiWk+EyOCoYxCb6f2Jpjm9HSXj4wsdFztTXznOfpWNW7VhRfWLIqP2T32j00JkwY
         5T0xDotaPsm81g+qwk6nDOy13FdIHJFZ7cB/OF3Sl4EUF8smcbyOhVAZ6IDxxsdVPj11
         0d+9dkf2xbjFfG83AGGqt1fg7dId/9FMSUKoc6bS/u9Vo1/iZ9doN5EZipN48jveGaME
         LIwEoI0e8HzgLoFob+mp5tIKAiCuQwJi56ljvcydBd2M4ac/uGmCna7jfhEYIUCVVcge
         eyaQQnLvMe1gipsKHBJUJoVze1ypXx9987Z2pVg8Gd1BXmQ8MWIIGH1V0rBidi7caI8j
         zWeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/L4AcYdipErf9TXxYGelmNsEIT68eZIA5QJTSgi5oyYm7krV1zlX/e99tq656wx1jEOFeB6NVq3UI=@vger.kernel.org
X-Gm-Message-State: AOJu0YySV7MSKrJUB9Qcy4c3bKI3A6ovNpe+ZXPqkZEjAtLLUWBEMfXT
	5BU4zGDrN6sEuv/eYR74PLwhD7JSJKOfAwkfnKtgEoj3siy3DMixCYQ10jUey4cXKUaVIvCJv4z
	n57k46zRUdOL50xSAa+ZohrK5hdEYgN6CtGrVGnXPZDZlozK/x58a4PT8+XJeYhs=
X-Gm-Gg: Acq92OGvcYaXJjydN3KueNt3nNqWfK51i6RgJgJGSrVK8cx9NIVcsSs2PvT4RPefCsN
	z9uTpixZ9GQli506Mn6d5GwAc/NK7Ysdk1eHSOuFSXMlZ0mV5vNw1NtlzkQhSBSzEiKdD1AY4oH
	S3hLLWANIxrZBAQxG0m3MGct7BcE9N1ua5lNq867BAzPerjFliW2g6jeasaBJS3hBvPOIxZP1e4
	0wCHSbE+0xPngCj0IBW+6S/onRcbxIK5iWi5iNLUibhNz+OXZHvvnVq0vu3XUvgWhk4c3c3YOcK
	l7AtNkKOVoldzUwOowCjH/HI1ZseI42TclyzLulkSx1cuFDiz3ubXgjqU43PQuHWFpWnbJQYbq8
	TqoPhQuqWKuM/YImMb1HLbMGJ3XOuzdYybG8=
X-Received: by 2002:ac8:7f8a:0:b0:50f:b732:202a with SMTP id d75a77b69052e-5165a04b49cmr191471031cf.27.1779087507081;
        Sun, 17 May 2026 23:58:27 -0700 (PDT)
X-Received: by 2002:ac8:7f8a:0:b0:50f:b732:202a with SMTP id d75a77b69052e-5165a04b49cmr191470791cf.27.1779087506469;
        Sun, 17 May 2026 23:58:26 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm35167840f8f.34.2026.05.17.23.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 23:58:25 -0700 (PDT)
Date: Mon, 18 May 2026 09:58:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Paul Geurts <paul.geurts@prodrive-technologies.com>
Cc: "abelvesa@kernel.org" <abelvesa@kernel.org>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "Frank.Li@nxp.com" <Frank.Li@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
Subject: Re: [PATCH] clk: clk-imx8mm: Initialize clocks in arch_initcall
Message-ID: <cr4z2qzawe3hlhcr4lvdf5zmlnt4cfbec7p7jhyiwgk7dkkwlp@3gu36sd3afoi>
References: <20260408101313.2082125-1-paul.geurts@prodrive-technologies.com>
 <l5fcjw4okcpk3nl243xqn7y57nr2mjjspjdfl6m3pi6smx4phb@2qp722n22lyq>
 <GVXPR02MB109688D7C86DC2A63D8BA146FBD2C2@GVXPR02MB10968.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GVXPR02MB109688D7C86DC2A63D8BA146FBD2C2@GVXPR02MB10968.eurprd02.prod.outlook.com>
X-Proofpoint-ORIG-GUID: fKpGgtknxK_uKko1PWq5svUXn8pOzNdm
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0ab894 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=926zIK9uAAAA:8 a=GegrNMS54E6FrsLxTi4A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=LlT7wNnaD8DP1V76ktP_:22
X-Proofpoint-GUID: fKpGgtknxK_uKko1PWq5svUXn8pOzNdm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA2NCBTYWx0ZWRfX2Lv3jfGAQLFm
 qX/a8Ww82w8VrmeMCVuQHr8yceIdJ62V9dyxjA0JV7twdcLZBQEh2twfxuNTZQtZBQN+N+8FHhS
 Zb+ip65N8Pyuy+3stS5LpHtfYgF/0kjaZN8UbVeBBo5cHNA+20bJrid7FAmavMQtx1VjAPSt1rV
 b36o7F5/TBSjkT6rp2yI8FU8bumxTUxQh8Rc1U4uBOP4+CaQ64zMK+OMUOYtO7jNGy3oCX4oY1V
 +dQfhXyaMqlwncqCDkajk/dfJszxFib7kiwD+69UXSh3emhlf6x1FXgRTj94Xka7JyJXU1HHZKq
 Y55kVB28UCsUEh1aXiaGug6UAxTt8+seODe3Co9YW75jcD0MDzquOIpmojkm480CuZt6XSENMqJ
 k+JBdCrgXMz/MlWZxMTuuKNCe/zuq6Hr0V1Em6V86lDTWZ3ZkYRDAeU9lFNwdJJ1F4yxUPUgUd2
 Q9ElB9JjTXtK1xNmiYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180064

On 26-04-21 11:14:27, Paul Geurts wrote:
> > On 26-04-08 12:13:13, Paul Geurts wrote:
> >> The i.MX8MM clock driver is implemented as module_platform_driver();,
> >> which makes it initialize in device_initcall(). This means that all
> >> drivers referencing the clock driver nodes in the device tree are
> >> deferred by fw_devlink, which are most of the i.MX8M platform drivers.
> >>
> >> Explicitly initialize the clock driver in arch_initcall(), to make sure
> >> the clock driver is ready when the rest of the drivers are probed.
> >>
> >> Fixes: af7e7ee0e428 ("clk: imx8mm: Switch to platform driver")
> >> Signed-off-by: Paul Geurts <paul.geurts@prodrive-technologies.com>
> > 
> > Nack.
> > 
> > Nothing wrong with probe deferring. It is there to ensure the order
> > the drivers probe in is correct.
> > 
> > Plus, moving it to arch_initcall won't solve anything.
> I disagree, as it solves a _lot_ on my setup. But I think the next section
> explains it better.

Nope. If your setup has issues with the clock controller not probing
early enough, then your setup isn't following the upstream model.

Please describe exactly what are the issues with your setup. Maybe we
can find a proper solution.

> 
> > 
> > fw_devlink will not stop the driver from probing if there is no provider
> > that this driver is waiting for. And if there is a provider that is
> > needed by this clock controller, moving it to arch_initcall won't
> > magically skip waiting for the provider anyway.
> I think you have the issue backwards. There is no provider that is needed
> by the clock controller. The clock controller is needed by everything else.
> So the clock controller is not deferred. All other things are deferred because
> of the clock controller.
> 
> I understand that probe deferring is not there for nothing. But I would also
> argue that the initcall levels are also not there for nothing. IMO a chip
> clock controller is an architecture driver, and belongs in arch_. Whether this
> is the correct way to do it, or whether this driver should be able to be
> compiled as a module is a separate discussion.

By the looks of it, you are obviously confusing terms here. A clock
controller is never an "architecture driver" and it definitely doesn't
"belong in arch_". A clock controller is most of the time a platform
driver. There is a big difference.
