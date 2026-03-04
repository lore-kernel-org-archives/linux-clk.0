Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04552EAB61
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 14:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772635834; cv=none; b=tIk6+w26hZ9fyHv1sN2nniIqLSFC+J9G02eIHozKYl6i3WkQpuGFt0QnGj7prYJ5DCs50kqJO354c+i0tEFxcdOmJFZBEz1V9lX9Ux+b9f/DneTQrZqWuNuQVR40QdHK+NfcwQPtMHYVUK9iguiROtkV4AAN0md5pwlsMC4R8zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772635834; c=relaxed/simple;
	bh=YLChEK5cpivtab2HRVIHw//j9o0ApVnaqOCsVAAfv4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6gdUoMsZ+X1nPlVaMOQSxRekPOenb8HY5emvIUtAteEvOzENsp4kIAFHFkGbdRP5azoEuwMKaVkJqfWOsU0F4ACbGEJED4L8X7iqGxb/gUPi+ZDH6nBJX+ns5YG+/57Jln7+fTaEpf7UJCELYKchMZ1yGWZEsKe7D1rZL25GPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aAiYv/Rv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QjVVg1zU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aAiYv/Rv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QjVVg1zU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772635833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kjfja2BGLHgTQbzQaDUH8CPxR/uuEmvrQqAUKSSf8JU=;
	b=aAiYv/RvA0rxfk6XhQC5kco8D8fHi8fH/vj7HRmaM2/ww2z4HUaenc+IgjzvFGV9MlPfse
	SNFejhgUORDJvMUmgpGUubnwvwHQQbs/Sfg4EETL7GcvWh/SnIp+zYwk9iWq+EhlO3UePO
	g7jxIhbr1moL/JOHd7zoBJCIXuOwtpc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-u6apHEs7Nn-rowLtzCRR0Q-1; Wed, 04 Mar 2026 09:50:32 -0500
X-MC-Unique: u6apHEs7Nn-rowLtzCRR0Q-1
X-Mimecast-MFC-AGG-ID: u6apHEs7Nn-rowLtzCRR0Q_1772635830
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5033b62efa7so489657691cf.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 06:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772635830; x=1773240630; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjfja2BGLHgTQbzQaDUH8CPxR/uuEmvrQqAUKSSf8JU=;
        b=QjVVg1zUiOjc8PQxQnPlXa5Zrn9uLMgtWUioku9SoLnrUAsgQI3weAKgYy9wGHHQ9Q
         FTFBNty5f2HfrNoiIXzsNVXE3eRnlo/Xv6GAjguWafeQwOks0RZXaLDpNrWvT3ilbUax
         nliqZOgzmXZ34wgZdayUYzZvZuqojZVB1YM2RZYHYD2R+nKOhxRHJA1F+BdV4yzQcxTB
         OTsY4q9CADoBR/phG4YW1Mu8RGjeIEbh14Brn1UAzySpIfhu/M+53rH/mdNJhBKCt/a1
         mQ0AaHodNACQZdwEhBISJ6mAPkce6t06hGvM+lo7tNYGhf61shNlmyPp1cTjSHY5Z2P4
         fZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772635830; x=1773240630;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kjfja2BGLHgTQbzQaDUH8CPxR/uuEmvrQqAUKSSf8JU=;
        b=qHq7k18595s+SeFtFjvav6YY2CDxzEt+yjIRVMkzZte7MF9vd3T44hm3a1nx8Kksnr
         +CyGilAFoAN1NeFEWwY9RBB/EgV9fdrVtWkFYMZppZHDDywsOqNwtsvfJ+MVaDWtcXKt
         qX0smF1pbpBrULbf/Kf+24HUOUy9Z0ZP/vjuER4BKfxRLttKPhRVYEjH9/ZtLw1vlQoz
         2m1v9uMH6Yyw6GDnSfycqlDOgC7tKl17g3FRTZA3R89Nbho23mAQhhX006jH9GNQgLFS
         kXXzWz/tzm8glAMSIQe0GQmj6sewiEcqRLJjPyz4F8bc7vxzi8JTOGzefa+ASquyeJSm
         rQ/A==
X-Forwarded-Encrypted: i=1; AJvYcCX7LsTxWDqzFoF3HjWL/vXGES8/JlICvt5axOxV67rSBgeSboKFLF1wEvYrkXeCdZ/cRPW7kO6oazs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwghH9CsmrGt5zmNToYUVSCT5W8PArwpNaAhX9Z+BiZ5y9Vmc8u
	Y955BucS02sjEtgBAv3UDFCG0aq7WAa3calpvTQCKCEnpWRUJ9ch2bFBmeQWXuYnRMuHkVgrwfp
	3ZUcIst/ffuKi7mHS0QWd30uncoZV1EcKxWetrtsBzpLm6H8D6/WEbRk6stqqBg==
X-Gm-Gg: ATEYQzx2MTVGpYFaq0U60aZKBjc0rRjF5jJWkbSj5XwRO8+tgoKFm5KOre78BV1WhER
	9f1zn/3o9zdN/E+wz7qpu2rwNg4FdawHYM1AERVmS7GIhcIcpzBA9S9C1Rvh19p86LVFVji4sQk
	EkxBbLp3mXiOiTa7LMWOrtRfG+xwO/RaPsxcCvDgtdd9k1oNhvDT05gwYpLUsImKqPxWE2tgHr9
	Ba1DB8th83BNSfH9wSGKL9fjG2GkM7JhoseC71LG6+CH/orFnoC8QbqCsf2dlZ17eKG1z2Pl7O9
	ocIQLnHBwGq8V+fzc2j2Cuxdgj4OBdTf+cCZUzblqBJP2++g92fdSOQ77xRDOownOrkRgWdYRy8
	fXAb9Lkuk2YguPEFIZR6DKln5dPTgcZVT96WOmLRHqOQLcYJGFKes9MhC
X-Received: by 2002:a05:622a:180d:b0:4ee:4a8b:d9f6 with SMTP id d75a77b69052e-508db3a7539mr28470681cf.59.1772635830352;
        Wed, 04 Mar 2026 06:50:30 -0800 (PST)
X-Received: by 2002:a05:622a:180d:b0:4ee:4a8b:d9f6 with SMTP id d75a77b69052e-508db3a7539mr28470381cf.59.1772635829849;
        Wed, 04 Mar 2026 06:50:29 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449b4dc0sm149392321cf.14.2026.03.04.06.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:50:29 -0800 (PST)
Date: Wed, 4 Mar 2026 09:50:28 -0500
From: Brian Masney <bmasney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT
 from byte_div_clk_src dividers
Message-ID: <aahGtIkxtNPeeWKc@redhat.com>
References: <20260303115550.9279-1-mitltlatltl@gmail.com>
 <d2cdaa7e-1a17-4e6b-879d-266844958410@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2cdaa7e-1a17-4e6b-879d-266844958410@oss.qualcomm.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Pengyu and Konrad,

On Tue, Mar 03, 2026 at 01:10:43PM +0100, Konrad Dybcio wrote:
> On 3/3/26 12:55 PM, Pengyu Luo wrote:
> > From: White Lewis <liu224806@gmail.com>
> > 
> > The four byte_div_clk_src dividers (disp{0,1}_cc_mdss_byte{0,1}_div_clk_src)
> > had CLK_SET_RATE_PARENT set. When the DSI driver calls clk_set_rate() on
> > byte_intf_clk, the rate-change propagates through the divider up to the
> > parent PLL (byte_clk_src), halving the byte clock rate.
> > 
> > A simiar issue had been also encountered on SM8750.
> > b8501febdc51 ("clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf parent").
> > 
> > Likewise, remove CLK_SET_RATE_PARENT from all four byte divider clocks
> > so that clk_set_rate() on the divider adjusts only the divider ratio,
> > leaving the parent PLL untouched.
> > 
> > Fixes: 4a66e76fdb6d ("clk: qcom: Add SC8280XP display clock controller")
> > Signed-off-by: White Lewis <liu224806@gmail.com>
> > [pengyu: reword]
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> 
> Looks like more platforms have this issue.. thanks for fixing this

I hope within the next week to post a new draft of my patch series to
keep certain clk rates intact when sibling and parent rate changes occur
[1]. This will be for certain critical clks, such as the ones used for
DRM and sound. I have it working with kunit, and just need to clean up
some of my new clk helpers and commit messages before I post a v5.

I'd like to test this on some real hardware and I have the Thinkpad x13s
with the sc8280xp SoC. Can this issue be reproduced on this hardware? If
so, can you provide me detailed instructions about how to trigger this
scenario?

[1] Latest public posting v4 from September
    https://lore.kernel.org/linux-clk/20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com/

Thanks,

Brian

