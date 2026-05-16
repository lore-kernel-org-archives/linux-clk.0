Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9C53E5A33;
	Sat, 16 May 2026 16:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778947666; cv=none; b=l6VNFXo3bNbkWmslOkPkAgV98djEWCxRMZexd/vXxYtDFaw8uJWb0ZKxsFBwkiXre1K7pY9Gn2kD4Y7K/RsPVrUGMtUJnxJeInwt9iIDmZUQ8QIPWK91ddkYD8aJV58lb8I9JElNdCOGawkVL19zn2ltDnFEazDlzla3erGWP6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778947666; c=relaxed/simple;
	bh=m1vfWnJ74vd7bGhj4atmhr6NYGK70UqT47wptuvWASA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qbwJIUYHFjrKK5yWokxiIBkae7x/+F7aEo07hJ0pg3BCuA0WnhUXp5Fnh3vKQHFl/P205SaB0QcAmNMEItERqw0S8KdvD/X5vdtXsGcM4ufexlIhTWqWK/74STPTVbL0TRuqgei4/npfiVzeKhCJkkecIfjpu0NKV+3yqW4b03A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B08BBC19425;
	Sat, 16 May 2026 16:07:29 +0000 (UTC)
Message-ID: <daa8e97a-6422-48a3-8634-cf6d4eb8ab7c@tuxon.dev>
Date: Sat, 16 May 2026 19:07:27 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] ARM: configs: at91: sama7: add sama7d65 i3c-hci
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org,
 tytso@mit.edu, aubin.constans@microchip.com, Ryan.Wanner@microchip.com,
 romain.sioen@microchip.com, durai.manickamkr@microchip.com,
 cristian.birsan@microchip.com, adrian.hunter@intel.com,
 jarkko.nikula@linux.intel.com, npitre@baylibre.com,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20260507084805.481737-1-manikandan.m@microchip.com>
 <20260507084805.481737-6-manikandan.m@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260507084805.481737-6-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/7/26 11:48, Manikandan Muralidharan wrote:
> Enable the configs needed for I3C framework and microchip
> sama7d65 i3c-hci driver.
> 
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
