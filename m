Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3820113A88A
	for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 14:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735570088; cv=none; b=uOrYyFGMbo1JxySHK/USJSquVHgD+91zQyOTzbfjDw2MDFaJrJ57nmxUJtjxBuuuKCc5wozRVcLmEF98JclzwtuSNaKhxr2qxealzocAtea5dg8h2UExIxQViLBizryRtDgChTBpaAxb09yIirlt2WSUdG1deykkEEPiy2wsfHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735570088; c=relaxed/simple;
	bh=KjWCVNt+b9S7o3s1KA8w6AF2X1h/VQpygP/lXVopERo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HcGq4dFaIdQD6N0TWMjk154y7EoTvQCOwGVreHXyjefI7uBr9jSvrHqzO6EBmgJm+llowfQgJ1uMzwcudtEi3F36ZwsUkn/ujs8i2ZzEzGk8dYNARtuc1cD5piRj++vZJV6oq9ppeJOIDQKGTRR93FyBukXXB3WVC8uVZpBbzQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VkpdyxL8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VkpdyxL8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU9Kj44024446
	for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 14:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+3guYso3Coq0RBvgr3ogOEivDxl1AcdY4CDUyBo/O3M=; b=VkpdyxL8OuULFCJ/
	W0WeSsPXDtCBW2IewX5kXkTjqN+d63vIb+QsUKsCo+QIbLuz2HnXb7n4H9O6WhuJ
	V20FEMIY569IyfhilwKFu4jDdQaHu387K8WExIgODNnH1D4KuChJa0qJsi9MLjHb
	cCycIjsLD3btxa/VysQT9nyd5DzZLEj2AyitLfYLwjlSeWJrSz+9ZCkkmH1odFXM
	bTsRbgRh5d8iKxcRm5bhrLh9PHtlvegacGmoix0TCFyg5Z+q8XJ/LRaHRIgUn565
	cCRHC7W7gI0DjI0CLRPYMoLCAk4dy04qFlp9jR5crdDyqfx3s2/zF0YgC1olq/EE
	MHI0jg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43urt88ntm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 14:48:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6ee03d7d9so51430985a.0
        for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 06:48:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735570085; x=1736174885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+3guYso3Coq0RBvgr3ogOEivDxl1AcdY4CDUyBo/O3M=;
        b=smNtvHnE+IugGODpB6gKqF+wuzZGzJXrKldK8z7mh7MgfSx61Qse008Qg2keL/xjKn
         n1C2SYpGvAMp6qEM5uXESM0hWB37EUCRzmdWW1KPzFKlRj0imPVDxPiCVLIXIbBNQeMs
         QkmBRr73xtlJ9Y3gBaiORK4rvlrtNH3a/+R6ZcOoqAXD/OKZF+NPayYcS1P5rf6S/WF2
         mmbbIeoiaofsdNE091p20tXU0yA8ZP798JXQlK9rtPabnPTgP5swyy++NT3+Z4qtLHsP
         BGCOEG4dS+4NXzobmt3hk4q+rYlFeLMYVeg9SIbBHc3GTLGCAqB9qPHC+Bdgl828uSzu
         Gf7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTYFfWjmyD6Eir746m8fhZwbJAINOqJrA50ihSrXnyU3lxW7LRT4al5aYlmp4O7Xpe8BeI5sd8DEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqpdqOANiRVBK0Yw+CyN78fhPrJOhdceUve3aBZ0kwH+aRQLMZ
	Xa5HP1Lqxadi9hK+BI9zeWUzh+9XuGTGY7W4Na6IIuUiT7HjgwKwoexX4wHluoBCCJi7Ir8BhnI
	bmzM8BDom/CgrCRq9PlKq5VN5wEyfH3aWfTXO0QZreO7OWja/KeXHA0k6RaM=
X-Gm-Gg: ASbGnctyOl0lNxzdofK5aZ+Yx9nlawF+4GF4mPS//uTsbZ/hKHTZnyVy+kjhnxaHv8+
	0RKQ/d2y+FUGSfpb2/nHyKHjr6rx9+rly+obw3VRy+1HzKJcktDxqG19fRse+QYedkk2UucFqF5
	VqmrLWVz5KyKsWpeTOz5Si7lhlHJeCHefWZ+Y9NBxlIzTx2mfZSQlUERUHU6SuUTEj1Qpxi7ysq
	l0QvjhIFuDcuA1r3hCwUO146Eb1ie2BEWtcjLBZ+Pq+3+7n/rzPuE+o/I+9NfG7OWIFd75TLMr9
	x10XKbMoCK9t/qme4hZMUNJVV8k/DW6WuQM=
X-Received: by 2002:a05:620a:4053:b0:7b6:7031:e15e with SMTP id af79cd13be357-7b9ba7eab6cmr2092908185a.16.1735570083768;
        Mon, 30 Dec 2024 06:48:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBDKqMftM4nCBgeB53pdAJZx4SAkQGmWBfeiR7UkWSQ67bAd/6KEwCNArMS45Msy6+U2XZnA==
X-Received: by 2002:a05:620a:4053:b0:7b6:7031:e15e with SMTP id af79cd13be357-7b9ba7eab6cmr2092903785a.16.1735570083354;
        Mon, 30 Dec 2024 06:48:03 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f015b53sm1470383566b.163.2024.12.30.06.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 06:48:02 -0800 (PST)
Message-ID: <befd6574-b9f0-4483-a767-684a729cfde0@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 15:48:00 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        konradybcio@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, richardcochran@gmail.com,
        geert+renesas@glider.be, angelogioacchino.delregno@collabora.com,
        neil.armstrong@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
        quic_anusha@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        netdev@vger.kernel.org, quic_srichara@quicinc.com,
        quic_varada@quicinc.com
References: <20241025035520.1841792-1-quic_mmanikan@quicinc.com>
 <20241025035520.1841792-6-quic_mmanikan@quicinc.com>
 <jhykmuvgltvuqf74evvenbagmftam2gaeoknuq5msxop4mkh65@dya6vvqytfcx>
 <21365836-aa06-4269-885c-591f43e2e5fc@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <21365836-aa06-4269-885c-591f43e2e5fc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mBtZ3MzZw4ZBHZZzP_QJ6l7vVp2h22oE
X-Proofpoint-ORIG-GUID: mBtZ3MzZw4ZBHZZzP_QJ6l7vVp2h22oE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 bulkscore=0 mlxlogscore=698
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412300128

On 28.10.2024 7:25 AM, Manikanta Mylavarapu wrote:
> 
> 
> On 10/25/2024 11:21 AM, Dmitry Baryshkov wrote:
>> On Fri, Oct 25, 2024 at 09:25:18AM +0530, Manikanta Mylavarapu wrote:
>>> From: Devi Priya <quic_devipriy@quicinc.com>
>>>
>>> Add Networking Sub System Clock Controller(NSSCC) driver for ipq9574 based
>>> devices.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202410101431.tjpSRNTY-lkp@intel.com/
>>
>> These tags are incorrect. Please read the text of the email that you've
>> got.
> 
> Added these tags since the dependent patch [1] was included in v8.
> Please let me know if this should be removed.

These tags are useful when you submit a faulty patch, it gets merged
quickly, and only then the robot reports it. In that situation, you
would be expected to send a fix, including these tags to credit the
robot for catching the issue.

Here, your patches haven't been merged yet, so it's not applicable.

Konrad
