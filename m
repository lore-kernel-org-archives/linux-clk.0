Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CBD3AE1B9
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 07:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780038359; cv=none; b=mHFCEVJJHbZ/JEj5WtFFbdAHy6rBXJd8sCTZSdv97X9ErHu96PxxJk13nQuv9qtxVjAOt/a+CuYPRoRnSlWTk8zT3X55iTWv6X2nDh9XItbW03ZzSbrq+R7Se3NwMXqJ60kVOEyKL4UWO/sqZQbmd00+ai7fH6VEkEbfMr09ZGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780038359; c=relaxed/simple;
	bh=2PAalM6kKnFYU06xQ410VdOXAbMQi4bwcAFMRjokBhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQnfbQ0dFlSr2CN3PIBioBubUlKvpCxwJIjP5/38cUSGScZo5XVFM1yYMqUHy/BrJzSBCc6MVhf79aFL1eKPJKqEYMAOSJDZlRKZqn24IQa6adfghbUBwnJJ/7gZH3KuU/uT/gsHr241GL/JCgaOpgsq9MDwTdvr6FDPt6QpGKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnDSv3kV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jk6XU5I0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnDSv3kV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jk6XU5I0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6RgRQ3252762
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 07:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uggOyLdQd0AYcPA6LkUyUkRX
	QuNDy/j4iSP3iw0FYuY=; b=KnDSv3kVDKGz+GjdoSGlAYotV3tjaBLTK3MzYMLn
	kdp026GxURdxXe89mw60cWHYa2lQYJyY5N6Qq6ulJ1+vrf4F1cK3sR13jvf/h1Pn
	O5xf6eZbMzUE+yInZpDuAUyvAuyJFCzmhDgZq5mi9fIQ7EDYXjaqrdaNsXUlNava
	7uLINZAKzuL5uYBDYoXPlFEZgPV+3dQ71Q1+Ekeqjebewt8zZHZfIrTEBG7Ruwxq
	NGZfoUHZaDDzyIkjdbISEh/C4Zj6ISwKkIni3k+Dqz0IRTTi6ASInuM2yw8T4w1g
	9P0xlHEIsdguTxiUw7+MBuioZA3oauMxtIleSRQoZMLoeA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eespn35p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 07:05:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so3638354eec.1
        for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 00:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780038356; x=1780643156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uggOyLdQd0AYcPA6LkUyUkRXQuNDy/j4iSP3iw0FYuY=;
        b=Jk6XU5I06hKOzEaJU7HG8GcXWaPxji/t2D5FGa29xWE6JU+frqEZTFqHzsVjZLFvwx
         l9FI+IKITTI/seO3g/mk57y40nzI64udwJlc0e2X6RICM+rfdcmzFen7CezqvJOtg0ub
         qSGp//JlAmabCbjkmjrVG429fRWsBoCoEEvSo+KYkmoUmuPhnBP7HySGKKIcTpYsam31
         LRpnwn072uy8XO/BEWXPpv8/TuyElksqfQoL8oRftQVWmyG0V+pCIzdF6Ws3Jh18fLuu
         lq9OGmJ6cp+0kgYnSG/zIzctTJMeKTzQ5JX1oEOCHeAslcF4hKkpsFJt1scO6pSoFCqG
         7KSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780038356; x=1780643156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uggOyLdQd0AYcPA6LkUyUkRXQuNDy/j4iSP3iw0FYuY=;
        b=ifFPW4KQlAurz6e2FDy/nkKOGjnalO1fH/JxSKOEYtN6Tiy5fStFZ1jxw1ykmM/z1x
         f+b70G26pSPMPiNEcsIQiLssr6bYJLddWa6y96lCqwBoLEWWcIGX2938nt0AprMYaz6b
         UOOhApg0X/oGo1GsRuKv/ZzVu4MNM06NEjtkzie77J5YaiLBmmm8yTVl4lvKNmyhR491
         mLbncw3tvhuv0yJ3649rtTHtS4cACfSbgPymmyRmaWIde1yFyaZKrYkrO7OBPtD/vnpo
         zdCBoEVUEYqqbrhm0WINGPb3iyNmWnJmqIoFQxoRCZPgi6ZCQNi6nDZmnNt4JVKSDzXw
         Ug3w==
X-Forwarded-Encrypted: i=1; AFNElJ+1gCk2bYGrevGzXkQg8Zuoo78x4HURKpzemE/iZG8ifySH40Up/ajP7XqOZZh4IaQSEuT/UWtqgEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuGElQ9kFt4wk47a9jO57of1OknNKvSipSjLzR4h2XbIN4W4GX
	YTepcyyZcvROPa5SeyY+JA6xEXeIsjjFuHzI9O0medNCqqQkmy+ESSqBtvi8hhX/iW6N5kqntsD
	lYdAOTW0C8gsnpl+VrQ1z7sC26nv8Io2gUsDOP1R+o63a2F9eoqTaCSj4fA+l9Ik=
X-Gm-Gg: Acq92OF9gdz2hWLDszoRmO97YN2LyjI+/M92WkXkmcrNryp7+ck0jpqjhSwxo1q8cwa
	oaR51QdiGFtb98V5g5Qh0d/WTJpCYRjBxxGs8jZn6Ev1OZ7CTHkLpyRcr3PwpEJNQCeELEH+9pb
	Dzz3O4cEi8+StRbmqhmuIlIvS5b/GA3gL4a7hMEbsq5uFFctWCQLcLwiJnX+fsMnXF+TN+QR90t
	/b65O9b6nH9WM9D6P4IW33gRXuVqpOzcGyF9jI0rGD8thBdibfYZ92+KLwmMWV29ZCQJCE3Nzpc
	bCzoqkN9crCTyH9OaPRz8tvLyrcXqULeQhxVaqBPcUGRhqEWDds8WYaAqW5DEX+fID8h6Snqtcz
	hMXd8tLQiWf1HDoMWbyosMGfcip161AxSzmHiDDbLP1ZBMg1wUR2etcP54h3W/+9GUFMitQ03m2
	z6TB4=
X-Received: by 2002:a05:7301:fa04:b0:2e2:4979:eb5 with SMTP id 5a478bee46e88-304eb0c567cmr819255eec.10.1780038355899;
        Fri, 29 May 2026 00:05:55 -0700 (PDT)
X-Received: by 2002:a05:7301:fa04:b0:2e2:4979:eb5 with SMTP id 5a478bee46e88-304eb0c567cmr819240eec.10.1780038355258;
        Fri, 29 May 2026 00:05:55 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed30fffesm746891eec.11.2026.05.29.00.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:05:54 -0700 (PDT)
Date: Fri, 29 May 2026 00:05:52 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: qcom,sm8550-tcsr: Add
 QREF/REFGEN supply properties for glymur and mahua
Message-ID: <ahk60MkNDYOgU55F@hu-qianyu-lv.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-1-ded83866c9d9@oss.qualcomm.com>
 <20260528-adamant-termite-of-drizzle-0c39de@quoll>
 <ahg04dmgSWPuA4Tk@hu-qianyu-lv.qualcomm.com>
 <79515bd5-a1c8-4317-bd15-71569f43e522@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79515bd5-a1c8-4317-bd15-71569f43e522@kernel.org>
X-Proofpoint-GUID: tFIaDG05pZhsYxkFRgZReQceJck74jzw
X-Proofpoint-ORIG-GUID: tFIaDG05pZhsYxkFRgZReQceJck74jzw
X-Authority-Analysis: v=2.4 cv=auOCzyZV c=1 sm=1 tr=0 ts=6a193ad4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=55C5z8EV8FhS1RBCIaIA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA2NiBTYWx0ZWRfX67GUBkfBcix9
 OvSZaElSX0AKvFS6RJJUvq6HYw0f5N5k+C88jYES5dCo1pNa1PBA1LmgJMdzYxQ3NbeJB2jM174
 ikHikPC1ZEwX+zTsEAeUvC7MDGSTQCDPrAXgECdhN+pboeGck/C6FjEHIcjjVwshPfkKhNSgp5V
 d5DEuoxgdib7eCCZW24wDrAYhWRkWAVPLqPQCIATXDj6ozWEh/Xj9iZP2TN8OVIMTz/pe6eDOK8
 OITcedJpNdix05p3EYJh4DbUvBeIZyr35iSF4IXzC5d/4UUrMg5FKjMsphmytQsK5FQbKFdURCo
 Cm8ybYulI7AV6joqWSRZPGhE2GD4LllQxx33KAJ8lXmXslFOo7X75+bgoi4Md07DP0uvA2xyW9Q
 D+J/pENK5Q2whtPxBREg18q5X3Kjoy9ECICoBOUzaZPnmBrm0wbCbC5NxGR+lmOzppFOmoXbnGn
 ddAGcX9VC0VCtJDuldQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290066

On Thu, May 28, 2026 at 02:34:14PM +0200, Krzysztof Kozlowski wrote:
> On 28/05/2026 14:28, Qiang Yu wrote:
> > On Thu, May 28, 2026 at 09:57:10AM +0200, Krzysztof Kozlowski wrote:
> >> On Wed, May 27, 2026 at 07:29:12PM -0700, Qiang Yu wrote:
> >>> The QREF block supplies reference clocks to PCIe PHYs and requires
> >>> dedicated LDO supplies to operate. The digital control interface for
> >>> QREF (clkref_en registers) resides in TCSR on glymur and mahua. Since
> >>> QREF has no dedicated DT node of its own, these supply properties are
> >>> placed in the TCSR node which acts as the control interface for QREF.
> >>>
> >>> Document the supply properties for qcom,glymur-tcsr and qcom,mahua-tcsr.
> >>> Both SoCs share the same QREF TX/RPT/RX component naming, but differ in
> >>> topology:
> >>>
> >>> Glymur has two independent QREF blocks fed by REFGEN3 and REFGEN4. Mahua
> >>> has a single QREF block fed by REFGEN3 only.
> >>>
> >>> Mark the relevant supplies as required per compatible using allOf/if/then
> >>> conditionals.
> >>
> >> I don't think you implemented my last comments. You need own binding
> >> file.
> >>
> > 
> > Thanks. Do you mean qcom,glymur-tcsr and qcom,mahua-tcsr should be moved
> > out of qcom,sm8550-tcsr.yaml into their own binding file, e.g.
> 
> Yes.
> 
> > qcom,glymur-tcsr.yaml? Can I use a single file for Glymur and Mahua?
> 
> Single file should be fine.
>

Okay, will create a binding file for glymur and mahua in next version.

- Qiang Yu
> 
> Best regards,
> Krzysztof
