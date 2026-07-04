Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C081619644B
	for <linux-clk@vger.kernel.org>; Sat,  4 Jul 2026 00:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124406; cv=none; b=qBc3888v51MNbEs5fxh85tRpt6Y/3t0N3CP490o2Hbjp/2HOy56ltoM/KwZQQesiMbBJccg5a7W7OHikGdkc5IgT+tITdHO/JycenUw9wfF+SxYGRRlhQPSu6Ho0GM0Deyl0Z484kDKpgGGqM+S4pj593PP6PyXTpldce7usnyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124406; c=relaxed/simple;
	bh=mEQI7do9Iqc1c2gISo9LeR3usM0VDK81vCAhQqOW4qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B00A52tNdpkJdr8lMQOBofleHi5KODpbzFP8be4STYKTrXOlnd2uNX5uAwvjtG2FpXiWEfoioUzLPTx/DZMbYRfdX6StIZchcLdbucfDMXOJX0/lTWxTU0ARc1NjFTS+cC8ph77PzwTlSgfSG/YDpjgdcZ6NQDQVlOP+AJsOrRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3jKSJzv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=czoLQwZH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3jKSJzv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="czoLQwZH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPrAv1031312
	for <linux-clk@vger.kernel.org>; Sat, 4 Jul 2026 00:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9lUKpFWz5PmkCzLO8fgMFrU2
	42KEVDXcNvH4yZS99Ms=; b=T3jKSJzvop/PatAb6tWlukgQlAzMR1WGzB1ciRKf
	XALPyceqZTal6YQQBv5XMQhTMc0uLqwCLkpLdEYLEy7LmlqYj+ZRipm2KzFQZYcX
	g5rCThAzM2arZXisQ1mkkocNwdX0FqRlu3i5mLgwr/5KkXRZWCk8BOVJ1plDFl2F
	iuWWnr60/dANF4IkxA3gzflFPr8TWqqglO5TkJ4Fs/g4f0QoG2B3YfqweQmEQFl8
	qkorWrtkQ49/pkdhaBvxHVEovBP03vQmCBcqRHxNt/W7v6b8EzN70fz5XI2z/uWY
	BAjIEtZi0QJ8GCNpycY/BT/bEntAageEzRxzk/oiRk4tFg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5caw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 04 Jul 2026 00:20:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e68cb7a3eso185876085a.2
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 17:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124404; x=1783729204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9lUKpFWz5PmkCzLO8fgMFrU242KEVDXcNvH4yZS99Ms=;
        b=czoLQwZHiRndREDCkDVEdUhUtZ85AzgWHgmqiPgWa+uSPR55lSgFyOvC7+gR+MCebR
         2U9YtQLYxAMLxV9iN799qjePgvROTjjtEFRs8v2QcfdJCNhQ8D7iGY/BWfTbmGCngyxt
         iB6ypwQ7OZEO2InnaNes8YogszLEXRmRxHihC4nbviSHiApmWHzf2fURS+SJ09SjOEXz
         qAY2fp113hBvOmTO/N1pXsunPGacPNq3HHPCkEtARVMaMWEhqTsRU9KbQOnCeMNYzKEI
         E4EqtN1HHq/l0DlPBdjt/hmKIi6MQe9CqHr/XlKPt+qy1Owyh1Mp4RyN8NAKDBNKeoU/
         aw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124404; x=1783729204;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lUKpFWz5PmkCzLO8fgMFrU242KEVDXcNvH4yZS99Ms=;
        b=IrHFN82knHr2AStkj+h3c0Z783cT82rFMCzZgywbgY4Z9DJ67muev+a79qDQ6rOThj
         nUhjr43VJt3Y+HxesDRPFnemg5EYVam0lHSGaMKbYd83oDybhDFKWejaJc/IMCA9fFZC
         DMEhQBxZ+ZRMI0KHYjRwNPn7FyjFMkiARRkJjKvQMict/EC/Td0/DJad8BNAMA2min8K
         0xZTrPLz6apW0RhHew+ArT6xUdldOsb1OcFK8ooY/1ghE81sMfnHTs88tXF+IBlZBNfC
         u9uIQgjezV96oXQKzg2dE3GC3zxvrA/Q9TErwIEQGiG2J9qo2iNEXouqf+Kp6r4uZaBP
         czFQ==
X-Forwarded-Encrypted: i=1; AFNElJ9uEAnrwtXJjezXqxwE4WoVXVqNK9TqM/VDQmKKwuJDeptgLU2Egx/9fhkY8OOC1xX+XEScatV3Aa4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsJdI34Jx8opO2WqKw9Q/0jh6sHU6+ltkqc7VWPvo5Y69wQM9r
	ZpWSIZERctybcqoomSlDXeH6m/0uFweywhjMYKtwl4/tvQEVbjyHbAXJbREgz0j1L2Q6QBhTtDL
	LaafMg6ltTPmgni6QixcT/85aVrUdUimfpXrw+oLi71M9AQebntG8fneQeW3CKvE=
X-Gm-Gg: AfdE7clfJ+dRoVWa9XkSmDvaiHFZKJQA1POk0mjDETuwId2Sg+Si93a5XL1YLA4yV2p
	0ya6n+MwHrRKEwIGtGG8Tnm5dQUzlVh5niX0FpUk1IZSyIY8FkREROiMu22xipRaPGGf8BDec8B
	sHvV7omCtRnd8VycPwLthTxKmYfAqQT+JDM/IiYzThhb09QhtqeDIAiiYnY0Wupr/fXX4jdvhhN
	NGbSZ/6tqWI6VHGixvkiLIKjjol4xBTsQkOzDxh5LWupytrj25HXXynzhhogUIDkC0VCPMnpw3Y
	AOcFZ5+kd+cBKaBcjTWCvjXDrSkr7sTGh1BaqQTx865df0yqLZrxLrbttzzPbnPNJDoUBYzTCC5
	wbqfAHKMfFrLpKgNZnC3AS50onyev7a5/OtHNPJz9Wtt+iAb5IVwi8fOyDTR1ZpK5t/4Na6XoGe
	4DXwfRiTffaUjHwGVuxWUp7kbe
X-Received: by 2002:a05:620a:400b:b0:92e:6199:9fd7 with SMTP id af79cd13be357-92e9a32c2f3mr254520985a.17.1783124403946;
        Fri, 03 Jul 2026 17:20:03 -0700 (PDT)
X-Received: by 2002:a05:620a:400b:b0:92e:6199:9fd7 with SMTP id af79cd13be357-92e9a32c2f3mr254519085a.17.1783124403560;
        Fri, 03 Jul 2026 17:20:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c3a0asm851485e87.71.2026.07.03.17.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:20:01 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:19:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 11/19] clk: qcom: qcm2290: Update DISPCC and GPUCC
 GDSC *wait_val values
Message-ID: <rjrmxpuk4pajadm4ww6clq32ezpqdvivtarl6fx3t5tmigt3gg@2zqdxc5ihsob>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-11-cc13826d4d5a@oss.qualcomm.com>
 <e42a2ac2-6a2e-49ca-8396-b76fd0921178@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e42a2ac2-6a2e-49ca-8396-b76fd0921178@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX91T7NmaxV2jn
 6yb8L5ucmrx+U/S/ZVa5nn1NzbX1FQ1oH6VxShmJHcco/XVZCxO2eWTXi8i29oBXIQkSBZs/7s3
 YOmULltzZB/h16xZUoZokCWy0ucySKk=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a4851b5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=K2wkK-n6QBhel6Q0DccA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: cXNRWfI4guAJpnRyPGgXSZVCZG9js4ga
X-Proofpoint-GUID: cXNRWfI4guAJpnRyPGgXSZVCZG9js4ga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX4qNjjVDC47tl
 p5QsZA73AjHd0xfkg+YFURX6JE4KbkfhSYi2T8d30aDhZw/YBcbkjLlpgnIrBGyny1gNCvSA77/
 pICwLawwYYX0DL2uNsqIo38yZeet4r7UtB9YU+YqFH9XEha/AtJeOJ3faBvlnIw3E1fsb4+6kiJ
 eDcCD8u09iRW7XVPPJbUwzlMEXNXky4pIUwVINQfeQXg2jG7wP1190LhgISrSaLj4C64Uyf7A7Z
 GcuYdSpsN30icfZWbHrHXR4PhhGZoxZKTkAGBW6G5dFvtgXUrHNB3Utnu+N4Lx48OSkOcCNXLg2
 na/R0tFgJDJZWGXo0CO0URdQ/Jbdu7+XBzk7WlqOhiwzpegnnD/5I6TTMAakKbE6u23XAtRCsfv
 mQwVm90w7Iw5wlP6Nad6SiojwgN6MpTabZsPIQuXyGbvioBHKTPV+wrrIpJjh5gE/00kaZ73aQg
 zg51iKDI72kSPifF2lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607040001

On Fri, Jul 03, 2026 at 09:19:30AM +0200, Konrad Dybcio wrote:
> On 7/2/26 8:31 PM, Imran Shaik wrote:
> > Update the QCM2290 DISPCC and GPUCC GDSC wait_val fields to match the
> > hardware default values. Incorrect settings can cause the GDSC FSM to
> > stuck, leading to power on/off failures.
> > 
> > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > ---
> 
> Fixes: cc517ea3333f ("clk: qcom: Add display clock controller driver for QCM2290")
> Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")

With these tags in place:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

-- 
With best wishes
Dmitry
