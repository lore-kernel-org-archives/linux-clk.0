Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B73E306757
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 16:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231782; cv=none; b=jtC48RUnZdYVwfI1iS6dx2LySqAHiUTzmHcW9Oj0xAHXyGRlbz1qn8CHbJaej9liNKIynL2A+KCdS+J86mrgDRO3gRo2xlNX9ptz+kzvMBRnBElO7dVWjKpyEg/eSoeFQYk0sdc04gPksgCqEEGhZGl5Tmsj4B5p0R5JkJxwo9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231782; c=relaxed/simple;
	bh=JHkYJm2LxbqzqrnkAL1v7BBOe47dtU+7DT/jd8f+7cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dqZTY1ssdYB34woqEX0zjcoxCG7nuQCkhRoSk+Xs+WDXnUKMyT9V6H1d00OoFYqy/QGhDBmLJwUM9aXRWdjrFKIm7ypiqn7dLEw2BSzen3UEdDvKlP1sa7ycEzpj5I8jW4KLj883lKveP0BVJ8vzhxjm7MKL1kW2DJdtyevw+Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dHDXLMeU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XOz+mwFC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dHDXLMeU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XOz+mwFC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBY26A3745920
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 16:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AB74uSf38X6zKKffSeJ2Ws92VBlI34TKRe2pQl6iJ/k=; b=dHDXLMeU++hRSS9Y
	Qq3xKpP/p34OQhMVzl0SM/yVFJmFjv8+ZE62xUE7sM7u/vur4Otlq0YuwFeLua8Y
	Ge6st7+UaAhmCLOuwsc0svn/Ne4I7F7zmqK/iqLz3DetCcmrlkcsWmKvhDpsKEhY
	nu8ckHCCSZ+PZdoABjTacTe28BHrkkIxApeeJlbV5khm2KkV8f1rSOu+CsH6Q1R0
	jmXBcLYz/T0oI36SuyQyAVlvUyiKhqBV+hp1Mozyf6tHaBfOjA4dYa27LmETkPMZ
	Q5PEqLj9aNzTjtdOucjdMUMgjoE6Ix8GaCJcaMr6Abxq2ZKz77GOijaRkdP9+iZr
	aj+HEA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eypx39xh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 16:23:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37d4eff15b0so118583a91.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 09:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782231780; x=1782836580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AB74uSf38X6zKKffSeJ2Ws92VBlI34TKRe2pQl6iJ/k=;
        b=XOz+mwFCWlZz7pZ0N/zomlNzMEdtnk4kdUacZXa5N8wdi6inIK5hSViAHhZWtVkuae
         UFt+eBRKwIkPTn3p3taC7wES+sKvAVQjLmbjpgN8MSdJdBSjWo7hdkQuHV37Xe7TojGk
         N78o1YOowyKntd5aqFCXvug+BTTsSXQFocqt/44SeFawPDyg+9yjT3yVMe0NvG7sLwpg
         rVm8lpRRuwdacLMJx4wkSOltcf+MYx6Kl+AzZID19JQOgl0NPc+tzWGMUc/XBoT+IsW4
         QwKZrJTuEKN0c/jKzLndCPXWVH6MHpQeezBLZTL1WVrGXtDti7EYAb7pj+3n1AdNuJwT
         htxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782231780; x=1782836580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AB74uSf38X6zKKffSeJ2Ws92VBlI34TKRe2pQl6iJ/k=;
        b=k5vgMZ1YTCgUkK+lnLLm3ve4K7y1HQ7am8LlwSGJTYugVOxjqEWqUzDXflQoDUi6OR
         ygcVRsod3TlQEBpEjFnjRSC5Hcw3Or+hVuKSGHfWq5hUXQbrrm/X2sp/ylxSvrcZ0cCc
         l+uRfv/EZxhca/pop0C4EApygkC1/Fu0XVLm+7vHrnh+ZozCzLBDhsuK1UF2LiDhhnZa
         VJjkg2FVWc8n+uckNjW2CUKbbTcWqs7/N2zR1evtPymwS2iThfr4tTN5Vm4oR1us43vW
         7BwIEamBNAzHggAhrs3WPkLc104LWvCsPln99Hj7qO4ldcS4Xnz6K1wcXJAHq+ONjEoX
         NrWA==
X-Forwarded-Encrypted: i=1; AHgh+RqpM5jiFqXjeqr+xCldIruCdjBTW0nLvTol1sVn3c2gX4l7ZQGqPsc7Y4vET520KwtWQAq0jRYC1L4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGTWXDm1Kf3oEp6KXoZt7PJAuAicPOIXOwlCGWj9RxOXb7jHdw
	eU1LobJT0u7yL6/2LP1XXRksmKlkTfPsdnKjfGqAAj+jbvh0j/VM/gCb8i3XddAWNa50OC9h0Cp
	+WpbZqyXVNaVOsv4BSNWvngJ1f8K/2IqN9xdti0WITx4qmmSoshzHujFDq2FHz5A=
X-Gm-Gg: AfdE7ck9AqFglukUje2hKGLyDOI5/h/EJ6kYso+sek4nM16CfYS5oXLo5cZkUInItp+
	u6h7120Wo5T92jfDtZx9WduJ0xCNqhDVAqfztoHSD9EHg61b0Le88ZHuoSOumoeo//xQlLBXANr
	XMQ9Mb3MtmDORQlrNbnuXmkaxjoQ8MZwu3tQpnIZsX78qZm6KFfbV16hbdtM3XrLnJWT6F9sPaP
	Oapos9z9BqjGRy+Y+iBS0bFeacui+23ERnpGk3sllyJJ2JpLZTOABuS1WvvgvnvdcksxADZZUFv
	f3UajhdufaqA9cmzYfKWD1urnUYTdCILyT7tpPgDkS2nnGxsJ5i6buHRhlvAgJ7JMfCRKwQs/zx
	spHsSnKyFQ+PfC/rf9XPd7kOybYUwwAfYi2HMfw==
X-Received: by 2002:a17:90b:3946:b0:368:f0d0:1ce8 with SMTP id 98e67ed59e1d1-37d16006570mr20771716a91.9.1782231779795;
        Tue, 23 Jun 2026 09:22:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3946:b0:368:f0d0:1ce8 with SMTP id 98e67ed59e1d1-37d16006570mr20771684a91.9.1782231779435;
        Tue, 23 Jun 2026 09:22:59 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.30.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f2f098dsm10079009a91.13.2026.06.23.09.22.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:22:58 -0700 (PDT)
Message-ID: <b78c96dd-7037-40ea-865c-a4720dfd8deb@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 21:52:52 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] dt-bindings: clock: qcom: Add Maili global clock
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
 <20260618-maili_initial_clock-v1-3-d6ede0352113@oss.qualcomm.com>
 <20260622-complex-dashing-gopher-9f43a3@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260622-complex-dashing-gopher-9f43a3@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EsfiaycA c=1 sm=1 tr=0 ts=6a3ab2e4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=q18lXC+Bm01JYF5cPAQq0g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VQuC0S_2QEiWgma_tusA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: f3irsbYA7YJv-SD4sUYpzvSVrrViT9_M
X-Proofpoint-GUID: f3irsbYA7YJv-SD4sUYpzvSVrrViT9_M
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzNCBTYWx0ZWRfX9iw4gV0vHMY+
 /xw7JtHI1R5NeFDpHFCIbR7HoKTGg9HhX4z29Zr09t1Q40+m0WFwCgGIz402Ww+7KtagWr5CTJX
 Xax9gut0vEHCAbJkyQNZfIWO0MyYXcI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzNCBTYWx0ZWRfX3jphM4OjiQAK
 QPTvjFPKtmTB15NLIhjStbNsr13cr+pjhboDiLw37Pc+SnL64EZtzjk1UX/obTtWVVa5EL1wx7q
 bSZW3rs+qmFkK6PlvDqHqOrepM7PxGWWP1rw30PHmClSF1fHFseusmXYwrLZint1Fnw8FoEA3jO
 mOBlWjL/b73Y8zLu0E7n0VCgdIxpdGsLPZwxAfiaR7q4qohy2p/3YqI+MaaMmaMUqWqzEmuCVEs
 WjE52YWQejXBtew218ndFdQ0xG/ltbzXZeqTSOxGgKt/5RnXFtKs0BDVrZG6fZX3+h6bd84GN+c
 KjoUwW+skcYaOLeVeqtKk2CvG/wh5YLx+a+wn/fVlUEr9Q+6TVwXEdsEdk3VfcoS7DNsjA7Ybl8
 EuJQ0wtMR6htNm9b8d9ltOVa52D5x7OZeblGjUBjEz6P2Hxb2Aud/99ctJ6WpDklcu0thVvul4z
 2RhvNdsLF0GV/DChYgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230134



On 6/22/2026 7:28 PM, Krzysztof Kozlowski wrote:

> I think this should be moved to its own header which will include the
> qcom,hawi-gcc.h. We already do it for
> include/dt-bindings/clock/qcom,sm8650-videocc.h.

Sure, Krzysztof let me take a look and update in the next patch.

-- 
Thanks,
Taniya Das

