Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECBA19D07E;
	Fri,  7 Nov 2025 07:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762501102; cv=none; b=RsvwQ9aKgTwu8wbt4MkDkULvfZNmlItU7V2XKLvgQUUs274VGr/fb7UBJ6h58nFlfGTayu6zYbcqiBu5kReS9ebmearG5/O4J2t129BvZqEOs9a/sinHFMPDS2kOr5qBxx/JQ0FVFDd3th4SP/G6SCn2A3668u4zhWVBVewJejw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762501102; c=relaxed/simple;
	bh=wxnF9UDlN2KL8vWxyumUhUWhZYGScRCsMP3ZVZwv4Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilsIIwb1e9gNBiinBC26VeqoEMn27fjk1KFudicFFq97XmKka4qZdqyIwuqgI4Ra0VP7/vvx4V0TESWxQ2UXWfG5XqiugU3UiKZvFkAjxtdGqdeASk+DSGaqJuecHgexuYqcZWNKwO24dv98HmGGUMDXQopBtKdj9YkZ92fXs2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=x+/55mW0; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="x+/55mW0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762500957;
	bh=FEpZb56KqjnmaWgqu/CaFTzPbPpQX/a3IPoGROSJb7U=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=x+/55mW0H/Y1odyLdx5jy7HMtum4j/QX62fVAUR7ajsJsaeNV1G3K4t2caXPdXsq5
	 oTJOv5HRxvZ+qGC1bP/E0YKxcnyz4zkKFOKyhbcnC9fXR54rdZRS2OQA8iVBi0azgM
	 0FWWsin9GgYJoDIogsX8vMF/4UDz05SkAGdHXRFY=
X-QQ-mid: zesmtpgz6t1762500949t9e620a40
X-QQ-Originating-IP: +YsyyQuPJCCGIZfNP5VNn0BbnRKFOlzj0C7lA1Gl3YU=
Received: from = ( [183.48.246.190])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Nov 2025 15:35:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10424017919000955698
EX-QQ-RecipientCnt: 16
Date: Fri, 7 Nov 2025 15:35:47 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Xuyang Dong <dongxuyang@eswincomputing.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, bmasney@redhat.com,
	troy.mitchell@linux.spacemit.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: Re: [PATCH v7 0/2] Add driver support for ESWIN eic700 SoC clock
 controller
Message-ID: <1618037D174FDF5F+aQ2hU1J9oLEKCq25@kernel.org>
References: <20251023071658.455-1-dongxuyang@eswincomputing.com>
 <1abb85b.c11.19a582bcbbc.Coremail.dongxuyang@eswincomputing.com>
 <039a3a41-c60f-4296-afd9-2bf3467574ca@kernel.org>
 <6d2d7ddb.cbd.19a5cf92465.Coremail.dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d2d7ddb.cbd.19a5cf92465.Coremail.dongxuyang@eswincomputing.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OBxXqL1mQt79/yaCmegpoxKThjDRBmYFsEyaJpdgJ4LwXDckeL0KwMQP
	woZsP6er6Gu71ytDiWGWDLDeXgDDLaJoPZZ9TB0LYMGAyoWuWDovyjSU0n5uHGGevlZDr7o
	shIJON1sVjG8WTnrN27r5BpUbWGwu1qjBKr37BePrnNlDWhhs4BrK/wYyuyMYY0Fi1k9M2e
	Es46JnszfeXztN/r+UKdNT6xZ9ML347PPGKgatl9Uh2ne3shLGtVDuhWE4EqeU23eDKDC9D
	5M5BRaJmA88PswkBnypSHOs0g+nsgTheVdxRhMeDFc8/cM0KNIPsnD4YwEClj6wcSCv3WwO
	aIliuFGlrmqqUxqn6+/p6ZDYkNlQuGT966i6P03k70QsLiAZOqFLf3fLtE8slAx3oMgtrxa
	mCcQLoXfV81O3dyxvh8dnS0ptOTZyRlLlh8AoT4jNa+cb7F2JLv0pfQ/73tmhmDsTIPrXmW
	R7ItsNX1SXtAd9NoAe+b0beXB5VrHm53q3snvbWCr4IW6dOrjkNQLu7M/BUQ28Xm+I1F9rc
	wWlYMZk9jxYvCXGRMZZIMsGGTM4RWAYrzBTNg+HwgeNpfMnQsFO1cfxPv3J3E/Xs+RK8Ym2
	/J1ZGPEFXXJ4MY9HG89Bc6IBUfAejUE+BFdJjlXJGbQ+tOIWHCvFn42Ove++RFsFUlGfKcM
	+wLN4wcf/GwuuHey0swRD5MEvcmzmA2J+t4kC9NNQWoBA/pY3fXhQ10kEhqE2d6mh0AGDSa
	v2Yhl3TiYudftJ2o0uWpmMkgD4nQc/uYVGQVbVf6aL9TStbuTaJsxK8jmxRFIpuCKEfz3+j
	f2wIW+hX5aeXTCm+RoBbnCCroiG/MgkRQUbb3cfS1+j3Ki3u4DfuEnXTZIQ78V5vLN1eU/o
	iyS4H454OYdqTDclvig7w5N38zA5QWeckYqjBFfLPgtL/VE4EV4VTo5QBENK48Q/CdaxHeV
	XR5Dl9/0J4QAPL6xCwKLdmfWucDzoXf0MlDyp5HRFbz9NNG+7VnSUx6/UBHCoYq9Dxzk0un
	UZ9rYP/vAvR6WeDOT22gkvEFHX2ud/qHtUTX6G3mfK2H1aJILjX2RSxjrypBQJPkFkGJBTL
	IKCmkDBSBmBepNA4ApV8nseC/Vxn7dtkkgGJQgftKh1TWY2M2GSprwTab9LTMvJJvjTxCdh
	9AIwzC9cxnpPNO8MPDCTqUuDsQ==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

Hi Xuyang,

On Fri, Nov 07, 2025 at 02:20:23PM +0800, Xuyang Dong wrote:
> > > 
> > >   Gentle ping. Looking forward to your reply. Thank you very much!
> > 
> > Please do not top post.
> > 
> > You did not add any maintainers of these drivers, so I would not put it
> > high on our priority list. 
Do you have any plans to become a maintainer? If so, this patch might get
reviewed with higher priority. I think that's what Krzysztof meant.

                              - Troy
> >
> > Ask yourself - why would community
> > maintainer like to take unmaintained driver? So the community maintainer
> > would maintain, right? To add him more work? If that is the case, isn't
> > better not to take the driver? You see where I am getting at?
> > 
> > Also, I don't see any involvement in reviews from eswin. The only
> > reviews here where from DT maintainers, Troy and Brian (I hope I did not
> > miss anyone), so again - you just put all the effort on us and then ping
> > us...
> > 
> 
> Hello Krzysztof Brian Troy,
> 
> Would you kindly review the updated v7 patches at your earliest convenience?
> 
> Thanks to Krzysztof for your reply.
> 
> These patches have already undergone review within our internal team. 
> The reason for adding eswin maintainers to the mailing list is to ensure 
> that these colleagues can promptly receive community feedback and stay 
> informed of the discussions.
> 
> Regards,
> Xuyang Dong
