Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215FE29BDBD
	for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 16:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777133421; cv=none; b=Z9j0iY1XT5jnOUGoq3k8BcD7GB8GcrukmIUf8YJpShK9YYG1UfObIMcgEnUM3PPXtZ2RxZvBkMt4n8jKu+ES22NOL16boN3XkHmU/eBOuVqarvtCZX5ceVKrSxlQzeHBEnP2ZtbYhBChPiZVVRycPBXYhlfVpJMQIeeGogjbY7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777133421; c=relaxed/simple;
	bh=/xP97QgAG6Sng4UBN95jLhjYqSOXGbVKmTTI4VSPQP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PJoNTWQXsZd7BcBl47Fuoe8TBqc0NgmsHgKk/LvYjoQBdMw6mYwvjFYcsUlobC+Lh2HFW6f4wI4mkRQJx1ormD9Hf6CE5xVRdG0YUqM8vxy83lnD8qiOlKPaChVpso89NjW/CzY4sBVKJK2etUXTWSg4GSk1Vm4Qt9FbueyBAQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=riugWtBY; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="riugWtBY"
Message-ID: <39679013-dacd-4804-a52f-0c36adf8e698@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1777133415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ynvlte9oVbZie+t6M0KrIDaGSCpcnJUqWKTJmYdMj54=;
	b=riugWtBYbVQv0zypxynL+IKHxdMc2b8mHqS5dIxewMS/uFtZDYwszpg3Zg/mSW/JlvMiWL
	8Z5Rs5St9Kq15aZPhBBC/Q7l4R3xWToOnSTr+jXHoaoGBcLYRF0fU3g9cdmuE970wlX+GL
	TAq1oXtn9gj5UR4g40hiplboskQxIij2AiZ9g7L+Z4My95kKxnEkDd1ms2MwaMr+ua8Soh
	rraLni7j4OFBifvn+Q9PPTBWlNlOSzuSTEr9gLTRxC+2vYWGsE3qVICs5l7k67v+QQ41Gw
	jn2Q/KunylD/BBXAemhoUbGXAbR5RylGvV5Pw5loqh50NrMufm6Y0cdZBZPrPg==
Date: Sat, 25 Apr 2026 13:10:04 -0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] clk: qcom: x1e80100-dispcc: Stop disp_cc_mdss_mdp_clk_src
 from getting parked
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260425123351.6292-1-johannes.goede@oss.qualcomm.com>
 <CAO9ioeWUp_SBnkuNejRLb9E1UvrbCJXYcZr0KgWJgCVZKRLL0w@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <CAO9ioeWUp_SBnkuNejRLb9E1UvrbCJXYcZr0KgWJgCVZKRLL0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 4/25/26 9:44 AM, Dmitry Baryshkov wrote:
> On Sat, 25 Apr 2026 at 15:33, Hans de Goede
> <johannes.goede@oss.qualcomm.com> wrote:
>> Parking disp_cc_mdss_mdp_clk_src at 19.2MHz causing the EFI GOP framebuffer
>> to stop functioning. The EFI GOP framebuffer should keep working until
>> the msm display driver loads, to help with boot debugging and to ensure
>> display output when the msm module is not in the initramfs.
>>
>> Switch disp_cc_mdss_mdp_clk_src over to clk_rcg2_shared_no_init_park_ops
>> to keep the EFI GOP working after binding the x1e80100-dispcc driver.
>>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Thanks for finding this!!
> Most likely we need this to be performed for all dispcc drivers. At
> least for all laptop usecases.

This is relevant for phones (ex-Android) as well actually, though there 
have been attempts to fix that by adding stuff like

             clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
                  <&dispcc DISP_CC_MDSS_MDP_CLK>,
                  <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
                  <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
                  <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
                  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
             power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;

to the simple-framebuffer node. However there have also been some 
"random" issues with the handover to mdss drivers (even with the mdss 
reset) so some postmarketOS kernel builds completely disable the 
simplefb driver.

~val

