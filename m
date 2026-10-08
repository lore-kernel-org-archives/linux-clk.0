Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2294848AA;
	Thu,  8 Oct 2026 11:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460461; cv=none; b=okco5kbCmjZq3uDpMtNFWg7+Oueg8qlSHy0pTKyM7uchm54T+QZde/3z8iyQZx6cJQoWBfiE+/ce3MdpGHrVvcr191EcqncbLHNpPJSZwqXzgLFRZstMqtQ/WkO3sL4pEZUHf4X60KTguKqAufrYRmxKorVoicMoMNW8+kqzkgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460461; c=relaxed/simple;
	bh=vZQj8F03eKZjqHoS1kyjyRVK66FHAqylnE55upW4CYk=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type; b=NbRObP9NmMLowzeA36GGho6GaNPVhijCk7/S+Da08My19f3rIDoKbBhL5kGI6BtJ9dOKqb9dUafHVE8GtKAn6Lev51MCHjswohPZ1aS0gTKMHc/ejaWPOYRURtuPKO04xZ1dzAR1rizB4yzwd3szkUUUKIiAIkXwTOAPJdUyW48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=xhQIKzzB; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="xhQIKzzB"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ivJ2v5zKWSZK2Hlo3sSMn9vDqFxCr2EdYmJo9CmMEFc=;
	b=xhQIKzzBOWZqWzZ433TvCdKPif2/1PNZx4RoUeXRkyxvtnfkiCCj1PwGvwAhmbpUAqEdTcy4q
	8v2ZVVPo9kmFuvXQTQb5tf48YPKJ0xjoJaKY9WhBnXA67NRQMMTT2fw2+SjPn3f0QiBgVsQqSsl
	lnJh0J8nwznhdFOnLcJUYl0=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4j0p4v57xXzcZxr;
	Thu,  8 Oct 2026 19:42:23 +0800 (CST)
Received: from kwepemk200006.china.huawei.com (unknown [7.202.194.72])
	by mail.maildlp.com (Postfix) with ESMTPS id 8BFCB40575;
	Thu,  8 Oct 2026 19:54:15 +0800 (CST)
Received: from [10.67.112.178] (10.67.112.178) by
 kwepemk200006.china.huawei.com (7.202.194.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 8 Oct 2026 19:54:14 +0800
Message-ID: <6AC78466.2020209@hisilicon.com>
Date: Thu, 8 Oct 2026 19:54:14 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: "Rob Herring (Arm)" <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert HiSilicon clocks to DT schema
References: <20261001212051.2227941-1-robh@kernel.org>
In-Reply-To: <20261001212051.2227941-1-robh@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200006.china.huawei.com (7.202.194.72)

Hi Rob,

On 2026/10/2 5:20, Rob Herring (Arm) wrote:
> Convert the HiSilicon Hi6220/Hi3660/Hi3670 clock bindings to DT schema
> format. Rearrange the binding documents splitting out the stub clock
> binding from everything else.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Thanks!
Fine to add hardware-specific constraints later.

Acked-by: Wei Xu <xuwei5@hisilicon.com>

Best Regards,
Wei
