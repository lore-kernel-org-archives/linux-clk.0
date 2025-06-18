Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7461DE4E5
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 13:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750255091; cv=none; b=OJHo+ioIbOSbb+AVxQCyD5noFzvDSkQI1G3Y8A3dae8EJWy8xeNEy1eRxuXS2KN9JGHYU/IQL//ZJblFrl8JZrc3H6olYhNUmVnyc+qoFvMHu+JApwtSTnfOuCeyn1seraONiwRXIQMY+8lxvO3J/YSiqL7Cp7pLdQyv+C3a/kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750255091; c=relaxed/simple;
	bh=2LfCqOvxNrz9yCs3dGodu7cHKffVPSLbjLkeZKE5QTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dy8ePTl+pthYaWTjoLYBGO5JmB1f1T2aibd/pCTg9mjf2Lo7YRWEbX6F9a2jBvdMxfv+sDwJuJV3z1i4g7yFSLq41ifNcKkE3SemdFTw5t5LgN/5voCJzS5/dNMmby37ChprPyxTOc4KgF/8l+d7GY4P9yhlLPo41bw5ANmVv9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZ0QXeDB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZ0QXeDB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I8CvDw031861
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 13:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xWNDuLjs61HKmyKQ2RsY6PEfjDT+y4fR+sdFhZngCW0=; b=KZ0QXeDBzvd6Mwq4
	eMA+TaaUD2+g74++ti18W5sHxyIUJIJ2kSFT0W7lb+A0Xc6BYG2vj8vlVui3ariX
	8jpvxvY8dZVDsTEG+GidvlPspaAKEkeV2NcatB50sMDmaw2Cdue6uzK68+qpQYWD
	8se0xUS5kCFqKkiR2SWffx78w/iPxFKG+q9Kz+7sVRhoInTh5ukrffhOHEMdFoQ3
	GFq5fbKDLjzNpWyllnGjKsg0lHZAE47QKMW+7yOlU8Tr7fGGbiVgMzAlKTYUQATB
	BOt+jBkzup7/cJ7U7G+1PfqgKdgSCyr9GmqITDMoOGO/E95pZYxfGP1llotGPEVe
	w0RoMA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791enm8tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 13:58:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3cbf784acso1275109885a.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 06:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750255087; x=1750859887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xWNDuLjs61HKmyKQ2RsY6PEfjDT+y4fR+sdFhZngCW0=;
        b=ouXfNRboK1mCBR8JgUQOnXKR6c3gHpxIEQUwwuOydD/k77BO7qxJiY0iheXLGvy8RX
         9cdHouArgZV4aKQPVEiH/J1bQYgodmOOcVs7GMINoylq0PMxECAavbZg6WLPLnLsx/Nd
         MCnhQSZFxKUKFKXdyuHacs6U/B+L47GFLeaGUsmpLoI0r8frUFJEW+AQdkQfZkvx4+b5
         sSTi7Boa/P4JWVKeg3LvXjUqf6TKjhoAZsZpi4sbD3E0BbpkKuHFvC0+3eIolqeL83JT
         4ptw5F6kjRo0D6RbulOFBm3nt2qq9N4eeopG5OPWEF7CENM/6Q13vyEKM39J9s9TWLQw
         2+mg==
X-Forwarded-Encrypted: i=1; AJvYcCXrATWHM/xAG+/+aEuBOQZ9+xZvBBGzoEPpqSg0lGnQiOULk/6Yyi2c3uIktNBJ9vND5Wl6xrqE1O0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVtMgN9lq8RXAyNdKxVkN7zDXgSx4Bgegkm2yHBbPxI8wnc/wl
	1GWOz4z7FqjGP/hcO0ECzYI5mobsh6gXzmrTKFE9gokO8M5yMR0ezEDoinXDCI2X6jwVGKAWc19
	lZba1yVgS033I0USZAZM6R7tBSmT+Kcii5/rtePaBKsBoOFvH9ILHHbPm/nkQwI8=
X-Gm-Gg: ASbGncvfVXJwxy6OjwT2WTvv3oxpXhAOfdj4TN/rXnhPFtcL/N7pGqR0nrf9CK8WEAp
	NDaDfJ6+DwAwmlItmbfGLiMl4y/UCOYr33cNurttc5xgZpg0LEhAfU6aj2K6G7ZfHNmvZzP+d/Y
	ftglKtLHEMjJx4U06OCG8tg8rRpQE8gpl5Yy2CsxGMmBtmiRsLfBGd6iIeD3aJNKLVWdaPj6oU7
	oaIu6Q2MBhpEzt+gIYB9BUGUT6PLcipEQa7Swa3R92PYpL1UrfMExbxsTQ6y4I2tl9oCV+gHIQU
	WGo+Bwxe6ybNna208qU5gTR/PbPO6qWScr3JlPwlDA==
X-Received: by 2002:a05:620a:4494:b0:7d3:c688:a4ee with SMTP id af79cd13be357-7d3c6c17879mr2527937585a.24.1750255087383;
        Wed, 18 Jun 2025 06:58:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0At7/LCw5/M/SPoralsaQOAVP/W8VEhHHYH6eAAF5BZgq79hxI+OOdeDg1uWbxWnHFjh9Cg==
X-Received: by 2002:a05:620a:4494:b0:7d3:c688:a4ee with SMTP id af79cd13be357-7d3c6c17879mr2527933285a.24.1750255086908;
        Wed, 18 Jun 2025 06:58:06 -0700 (PDT)
Received: from [10.92.240.160] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81bb9cesm1051140966b.49.2025.06.18.06.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 06:58:06 -0700 (PDT)
Message-ID: <28992d6c-eb98-412e-86d8-d35a96f69fd1@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 16:58:03 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/17] drm/msm/dsi/phy: Fix reading zero as PLL rates
 when unprepared
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-8-ee633e3ddbff@linaro.org>
 <n5djafe2bm4cofoa3z4urfogchhfacybzou763nelttgfspo25@bywfd5febe6g>
 <dbcfcb3c-0cba-45f6-aaed-b79494d96cde@linaro.org>
 <738a889d-9bd5-40c3-a8f5-f76fcde512f4@oss.qualcomm.com>
 <8a986ebb-5c25-46d9-8a2f-7c0ad7702c15@linaro.org>
 <24xkss4bw6ww43x2gbjchcm4gtmqhdecncmxopnnhf7y2tblc2@iibgqhuix5rm>
 <f2654844-091f-46bf-88c6-6f6d4edc5533@linaro.org>
 <fa8d4af9-e822-4dec-a8dc-f3bbf5dd0100@oss.qualcomm.com>
 <07af3f49-6992-4897-acec-b2d46158fa00@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <07af3f49-6992-4897-acec-b2d46158fa00@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dS8pzxGKpkcWczw7W2wBphsNTu-Ud-c9
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=6852c5f0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Yv6ZAifYCY2YzpHKyskA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: dS8pzxGKpkcWczw7W2wBphsNTu-Ud-c9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDExNyBTYWx0ZWRfX0tFfZucTat3h
 moAg0J8JWuoTFv45AqPoAp8CswQYKf1IDj8n5lpt6GWSO/17vcXcoEtJEoxhx8VA4D2aHXyAkyo
 GudiIoV6/T7Ei7e/t7Z7ChywhmgOXDCo1SiHM9ieOso+j0jcjrXcOSpy9kaVei4wX3DJKgqsXHP
 Rjk7VIueDSgvU3gRSAMolmyWsaaY8++N5i2xOkG9OfoBDM/JoQ5JCDMnEVqC1TmEiMGUEgU2zba
 M9A3Yd+OCjD7JLkCetCGCN5zA2fgeiolM/cCSDUffcEJc7cfNTtW5OiXyeb8oa3p2K/x8a5aFfD
 Rm4YEz84F9tU00rVFmVY3jx8Qi8rynxLbB2ZQA64YgvbAXM4iwJQTtvQ10/hTN+8ugrduXEcsBD
 50YpQNxUrmYoNc7nsFpYpx7+tlUUrVtD1sGp/fDusaUCaOOQgn0CerOvBcU98yCAt63vnYgi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=934 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180117

On 18/06/2025 16:54, Krzysztof Kozlowski wrote:
> On 18/06/2025 15:39, Dmitry Baryshkov wrote:
>> On 18/06/2025 16:34, Krzysztof Kozlowski wrote:
>>> On 18/06/2025 15:07, Dmitry Baryshkov wrote:
>>>> On Wed, Jun 18, 2025 at 10:28:10AM +0200, Krzysztof Kozlowski wrote:
>>>>> On 13/06/2025 16:04, Dmitry Baryshkov wrote:
>>>>>> On 13/06/2025 17:02, Krzysztof Kozlowski wrote:
>>>>>>> On 13/06/2025 15:55, Dmitry Baryshkov wrote:
>>>>>>>>>     
>>>>>>>>> @@ -361,24 +373,47 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>>>>>>>>>     
>>>>>>>>>     static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>>>>>>>>>     {
>>>>>>>>> +	unsigned long flags;
>>>>>>>>>     	u32 data;
>>>>>>>>>     
>>>>>>>>> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
>>>>>>>>> +	--pll->pll_enable_cnt;
>>>>>>>>> +	if (pll->pll_enable_cnt < 0) {
>>>>>>>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>>>>>> +		DRM_DEV_ERROR_RATELIMITED(&pll->phy->pdev->dev,
>>>>>>>>> +					  "bug: imbalance in disabling PLL bias\n");
>>>>>>>>> +		return;
>>>>>>>>> +	} else if (pll->pll_enable_cnt > 0) {
>>>>>>>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>>>>>> +		return;
>>>>>>>>> +	} /* else: == 0 */
>>>>>>>>> +
>>>>>>>>>     	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>>>>>>>     	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>>>>>>>>>     	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
>>>>>>>>>     	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>>>>>>> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>>>>>>     	ndelay(250);
>>>>>>>>
>>>>>>>> What is this ndelay protecting? Is is to let the hardware to wind down
>>>>>>>> correctly? I'm worried about dsi_pll_disable_pll_bias() beng followed up
>>>>>>>> by dsi_pll_enable_pll_bias() in another thread, which would mean that
>>>>>>>> corresponding writes to the REG_DSI_7nm_PHY_CMN_CTRL_0 can come up
>>>>>>>> without any delay between them.
>>>>>>>>
>>>>>>>
>>>>>>> Great question, but why do you ask me? The code was there already and
>>>>>>> MSM DRM drivers are not something I know and could provide context about.
>>>>>>
>>>>>> Because it's you who are changing the code as you've faced the issue
>>>>>> with recalc_rate.
>>>>>>
>>>>> Heh, the answer is then: I don't know. I think authors of the code could
>>>>> know.
>>>>
>>>> The 10nm HPG documents a 250ns interval between enabling PLL bias and
>>>> and enabling the PLL via the CMN_PLL_CNTRL register. There is no extra
>>>> delay between disabling the PLL, disabling FIFO and remobing PLL bias.
>>>> Please adjust the code for 7nm and 10nm PHYs accordingly.
>>>>
>>>>
>>>
>>> I can drop this 250 ns here, if that's what you ask me. But fixing
>>> anything in 10nm is not relevant to this patchset. You were already
>>> asking me for different fixes for some different things and I find it
>>> not acceptable anymore. Stop blocking this patchset with every little
>>> existing issue.
>>
>> I think that it is a common practice to ask to fix the issue in relevant
> 
> No, it is not.
> 
> It is common practice to fix things everywhere, but you rejecting the
> patches on that basis (coming again with some requests for unrelated
> issues) is not common and not correct.
> 
>> pieces. For example, we frequently ask to fix all the DT files if there
>> was an issue / workaround reported against a selected set of those.
> 
> And you reject the submitted fix of one DT file based because
> contributor did not fix the rest? Really? Since when do you employ such
> practice?

On a case-by-case basis. See the USB snps workarounds for an example.

> 
>>
>> In this case you can send a fix for 10nm separately, but please post a
>> fix for that platform too.
>>
>>>
>>> Or merge this code without this patch if a fix for reading PLL as zero
>>> anyhow is questionable for you.
>>
>> I think I've asked it at some point, to split the generic code parts and
>> the DSI enablement into two different patch series, so that they could
>> be picked up separately.
>>
>> No, the fix is not questionable. The patch causes questions though.
> 
> I have no interests in fixing DRM code. This is not my subsystem, this
> is not part I am responsible for. If it raises questions, why not
> devoting your time to fix it?

Then why are you submitting patches towards the DRM driver? I think the 
usual rules apply, you not having interest doesn't lower the bar for 
your submissions.

> 
> Best regards,
> Krzysztof


-- 
With best wishes
Dmitry
