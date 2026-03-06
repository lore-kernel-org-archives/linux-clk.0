Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19B72D131A
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 14:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772808893; cv=none; b=P82B+JPVlQnVooi0EPdVsMpOAhTFnd8oZunaAev1e2JtGX1rGJfVLy0W8/S6WgQylG6uTZnMzEUb3EdQuFCugaY3wQV9tWHjtKbT89JOf8nYTVMr+uBn/mSuo+X7KgkINCs9FNdubrdmhaHg1QX2YB21wZV8dXvp4nPuOJ9I30w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772808893; c=relaxed/simple;
	bh=vRXA33YAyKWIWqUJnitNhk2Mbm7qTnSXtav+2nonONw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FUd1VtYXS7DD9gLj5tZ+cHo29ASR0W+6SawCCOD7Ud6sm8THwXKfyWdBSfVtf9nts38FFPwBGPQVd8qrpL+BR03YfPZ+1NcAzq0Oon+gPo1YpmowDoolXrtm8WYjjrdkC/EBTQYQepQskhv0PtVJcdLNrZYIv0tP4bQFjLyzK58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fb7/MBaS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bl7LUNUZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fb7/MBaS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bl7LUNUZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbK4Y2022812
	for <linux-clk@vger.kernel.org>; Fri, 6 Mar 2026 14:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1jo4dkOGKYzreFcxdLAk2wdt1wGBisTqEORae+est4I=; b=fb7/MBaSsRmjj+oY
	NbVGoj2FI5KdrLehxJBOqEEghYoQ1aLrH4D+HBHN5yNgzrX2av4m2+GuIYp0NlKM
	QmD+F8jPMGHMJGVQgA+K+yAQQRpWxUuZRLmTiz9DSwh54jNUKpn5ChPFaQjFyaY0
	1MIrupWuIoujMKjKJ70v62IRc33gpUnlIQXwblF4Ff6cOZtNPfJSCUaDng/RnKsQ
	DdKIj9XyQnfL1jcKzAA+o7yR2u0Aljtq4Z/81Yt2iIKk1LPbgd/gXDbO/TfV8Rkn
	XVs1PNL4gOywHPSDaju+0Bn6YZWeDXl3hX7g9djPeb+C7Oe2MYr0gtJX9s4OEHym
	Zjyk0g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg6bhw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 14:54:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c737b6686ddso1798376a12.3
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 06:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772808891; x=1773413691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1jo4dkOGKYzreFcxdLAk2wdt1wGBisTqEORae+est4I=;
        b=Bl7LUNUZ/IOmKVsYMz2Bzr7rBRtiC8RtmxExiZi+WXEfUWy5XKFfs3ylimhE87VRLM
         pX0t4Dbg1oPzMrdETqsYRXFO14w1ap0Yh4YbqBOXzhzG/isRVCGFIS7bWWqo2RYP6syH
         Hn02FVLs1bsWYvLzDKsMfvqWCdi+S9xx3m+a/wVcn04LMiQN7l8iKzu2NMMBFHoL0w9/
         sJCMYRCf2fIEcs4ocm0UXRks46zaGJfQvGDcK8N3zE0CddBTZhnDoCM27TyKfwlDU79B
         pmunR26EQtLo5Re9rZrGZSQJzc6uQU3KbUfauliD6JLe2P8yHvQAhE7BmRI4bINdNAOm
         mycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772808891; x=1773413691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jo4dkOGKYzreFcxdLAk2wdt1wGBisTqEORae+est4I=;
        b=w7sGmXjwy2te+crXYM4dxe3LFuLkQiu8ZFdIk4DFlWLEZ6uuMWMHzaohzjVGEN4MqI
         MCZ0QJbTYUCprmf3Am+i4/7mVWpQnfZIsrD4o8tU2bDZ6zVrvl8QYQ6CmlWW2jkrBt8e
         fbV9mBigNYZpimYQOe0ULLH4K8FUzKk0eYIjFebP5yX2QJ0hLPAk970dtXIr9dk6vR0d
         PT5HUT/2mS9nE2aZ7AEov/aBdtzc9Q936eekP9Qq+lx+aTOzGd6KcTbfl/BXZLMTez20
         wXS+C1ZmtozycOifnxqZ812+d75AxaH8+tFb3BZDdILihae/imYEpaSfouh6kO6CSnzn
         MZRA==
X-Forwarded-Encrypted: i=1; AJvYcCVHCmZAsq0omKsgA8WW6XfEVwcxWBYZjb1i2wydmMHWWlpwmsFGCt/7aYeW5OZ70CfiLWwoC7k+qh4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSZ4DAKDJvureTS1kRlK82bqSnN5eI9hWlzur/ZC/lfNZc9Nl+
	xVSkZfal2bVMmA5/xagZ2C7xY5h54IkR5kZTaimrRmxqIq/WQb7USqC4ad+s1uJGnU+Pppo6Pfu
	gj4DpRi2xDWoLUZM3EtKtD+so+wontQpdE8wcaaqHLHamleGrPTpc32xlvY4kHxw=
X-Gm-Gg: ATEYQzyI2nLfhgTrH6H78/LklPpNNgIHQpurmDgaBW0cHG/haeDs8/2jst1J+QeGHCc
	k0jp+zyDk3BKkezAgyUOlr/HG+Y2+OwwHTC4vVm4cWyxzD69ZzTXcwzVpnMHtrtQB5vICK+acnw
	+JAj6md1x2T/y0yfS4X94el8XH5doBintTimxzHaq7WygzB6/h1aMBVsAG+ra0wE2vY4JKvfAde
	Ar1rUGov9uwqsm81HmdbdMp0HRfnZVPNlb730fTtSqHPjJCTgjn/W9zW/1fGa6uMlIXSCZzgjX0
	k8fTfnfSaR7Ca4j4Qsha450y7/DLLf3Vv8Cu6On2upykhRzrRI5H3KZFwUV3iTOU4ZQ8By87DZK
	Ibcde4Uy+VoevSFiS4ZG+zvo53pTnijAsPmnmfu0wawCc0oQAMnn4LQldAGzlxO9ZIzq6psspBO
	vjZt3jGcCSBJM=
X-Received: by 2002:a05:6a00:b483:b0:7ff:885f:9c2a with SMTP id d2e1a72fcca58-829a2d81fe8mr2047823b3a.12.1772808891299;
        Fri, 06 Mar 2026 06:54:51 -0800 (PST)
X-Received: by 2002:a05:6a00:b483:b0:7ff:885f:9c2a with SMTP id d2e1a72fcca58-829a2d81fe8mr2047777b3a.12.1772808890773;
        Fri, 06 Mar 2026 06:54:50 -0800 (PST)
Received: from ?IPV6:2401:4900:88f5:81:e13b:ce78:7823:d9c3? ([2401:4900:88f5:81:e13b:ce78:7823:d9c3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48d3871sm2054793b3a.60.2026.03.06.06.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 06:54:50 -0800 (PST)
Message-ID: <3e07a299-0ee0-4bd5-b474-b320502c5ff9@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 20:24:41 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
 <20260304-purwa-videocc-camcc-v2-1-dbbd2d258bd6@oss.qualcomm.com>
 <20260305-hairy-hidden-stoat-5c1429@quoll>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260305-hairy-hidden-stoat-5c1429@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lBlDp9UlaKcn9jzUnjNl10NS9ncXfvPR
X-Proofpoint-ORIG-GUID: lBlDp9UlaKcn9jzUnjNl10NS9ncXfvPR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0MyBTYWx0ZWRfXz+++8PzjexMi
 aL99tsei1yVp8TZPFkTiRcqk3EU6hUZp8ZXf+h1tqm0O1+BLEusvjmGTITPrg2lmK+gd0sGades
 NKcqCEf4i/q0W59OxTmgMGDMhHGL7E4YwcmoChjEEkAZ3fd/Iy4klFIyssakHGo+uT1BVMElOpN
 rUB0Wd/S2QnglLroYMyVSMTns5HHj+/0A3HE35z6jzLcC527Stm7qLIJTitNeieBWYPWtl8WQzz
 nLx5EOTTql6H7ONzTWbKlRRqhwAbf1Xw3Ouz/6FCP5owufYycoWRtydcdAYFgg79sVAFqBfBPUG
 WuTlCQXhOmS8oECGFQlnxPWUibkiGzWHo1ybnQRgKMy3HQsdMslvmY3FYwOags/Jo1WCIpO+GUD
 rxjdNy+IggYUkVhlC7FjFSKfQgmO5OGNECcrx7bMzAlogEkTw+lH5EZivm3XG4wfRexoxRWpPLh
 byS0+Vf4zO31aKCnbKw==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aaeabb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=6d1n1Ba-E67CpG4V2ygA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060143



On 3/5/2026 1:17 PM, Krzysztof Kozlowski wrote:
> On Wed, Mar 04, 2026 at 11:10:51PM +0530, Jagadeesh Kona wrote:
>> X1P42100 video clock controller has most clocks same as SM8650,
>> but it also has few additional clocks and resets. Extend the
>> SM8650 video clock controller bindings to include these additional
>> clocks and resets for X1P42100 platform.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 2 ++
>>  include/dt-bindings/clock/qcom,sm8650-videocc.h                  | 6 ++++++
>>  2 files changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> index e6beebd6a36ee1ce213a816f60df8a76fa5c44d6..e8bf3fcad3fabc4f3b7e8e692c6c634d1aed9605 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> @@ -30,6 +30,7 @@ properties:
>>        - qcom,sm8650-videocc
>>        - qcom,sm8750-videocc
>>        - qcom,x1e80100-videocc
>> +      - qcom,x1p42100-videocc
>>  
>>    clocks:
>>      items:
>> @@ -67,6 +68,7 @@ allOf:
>>                - qcom,sm8450-videocc
>>                - qcom,sm8550-videocc
>>                - qcom,sm8750-videocc
>> +              - qcom,x1p42100-videocc
>>      then:
>>        required:
>>          - required-opps
>> diff --git a/include/dt-bindings/clock/qcom,sm8650-videocc.h b/include/dt-bindings/clock/qcom,sm8650-videocc.h
>> index 4e3c2d87280fb9a37cbc52330e31b0710ab63144..ba2d231e9dc8718bdcc07f994577cf68413dc273 100644
>> --- a/include/dt-bindings/clock/qcom,sm8650-videocc.h
>> +++ b/include/dt-bindings/clock/qcom,sm8650-videocc.h
>> @@ -16,8 +16,14 @@
>>  #define VIDEO_CC_MVS1_SHIFT_CLK					14
>>  #define VIDEO_CC_MVS1C_SHIFT_CLK				15
>>  #define VIDEO_CC_XO_CLK_SRC					16
>> +/* X1P42100 introduces below new clocks compared to SM8650 */
> 
> I don't understand why X1P42100 was added to SM8650. Last time I asked
> you not to include other header, thus solution is to add full list of
> clocks.
> 
> This is completely wrong because you do not have the same driver!
> 

Sorry, I misinterpreted and thought it can be added in same header file. I
will create a separate header with full list of clocks for X1P42100 in next
series.

Thanks,
Jagadeesh

