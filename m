Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A3EB640
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068291; cv=none; b=cbGfdNnQoaMILy/A4O4G8XIHY3VaXNOAj6nSfHvu7lLIDYchvKbspZDG2A3efdmN2IsU+ifD0PWvuPWl4b7Ko7/3h78tsIWbATZZVUC9AeHfGM/+HKKLJOdC70edSvZWuqkAdygnhMpI+GpvtIA7V+syQ7w4iDhvWoCFsGNuLFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068291; c=relaxed/simple;
	bh=wJPB7UPd7El25mJdue1MKD7YwBnP+67VFnImxa+295c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/W+zRdFY2fQ71mKMQZO3gLH+tPSCgW2etxJyHz5cNZMhBhcVQ3QeMhOsHmUddMZlZo8Arl2PmbBRvsynW1cAC2oAQdV/94gbTiC+Mm8/UtR0V3ito4LFC8LrJxip1CjxSIG/8tmDNIhMqPJen6uCqn8bAwMH2HLGHv5OrkpqgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bdKm3KfK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M05MtgxA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bdKm3KfK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M05MtgxA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773068289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H1BNKFyRsZcHlEZIOZ9hlANGFti9fPCQQJkxNtYA6no=;
	b=bdKm3KfKZsaUM3XCnSHd9eHvZUfU+3nFtICquoyhy59MYsl+c2j36RwwQaCi2XN2xLXd45
	cKGmQknHPP+lW1+6Aq/7twTlxnozgJR7ceqEcfI9Wi+aDSde6XWOou1m4PUoGqX7Uxudx7
	Wwa3+8zViCjZNPqKf6sm22JFItmYeYw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-u0CnaaDOOw-0-8lAtgDNNA-1; Mon, 09 Mar 2026 10:58:07 -0400
X-MC-Unique: u0CnaaDOOw-0-8lAtgDNNA-1
X-Mimecast-MFC-AGG-ID: u0CnaaDOOw-0-8lAtgDNNA_1773068287
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50921f7da6dso3265211cf.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 07:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773068286; x=1773673086; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H1BNKFyRsZcHlEZIOZ9hlANGFti9fPCQQJkxNtYA6no=;
        b=M05MtgxAvJdt+JBg+1HHMdpJDPkmUTfnvmGGa8WHt4moBkW7XQL52Vw+jZhpJgNntp
         RaQjvZPC/gVfqol1teZMDwuJiH/CvBSsQzEeZtY2aHdwQMxwa2BBUmcndH/rUycYUlMO
         0CErWrFO2Hz5bjUhMgVXQDeYKqonDestivCln+m2zvEljBFeQHyW6nvY5G4rAF8cN87R
         lN/e4fYKLl7w81zKnLRr899dBrtMybFkhsbnyP7N/yk1JGSqZVC/KbHqwBw8mNf3Mqwm
         lszS+Me4x2Q1LD8Hi5Te29gPp5xhGLS7hDDxmGnK2HarlL3iHk/BQUx3Rv8AophqhoeT
         CiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068286; x=1773673086;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1BNKFyRsZcHlEZIOZ9hlANGFti9fPCQQJkxNtYA6no=;
        b=mEKwSJ/illeU0t3No5OyCy1qUAfELIHOlrrOLDy1AVS/dsAfS5TjML5xFU7HcHIJh0
         GYOKFrhp06mGGjnwuYH7pzgpUNWrcD1gL+W3l5BIrLnyiTQpq9dOTw31/+FJUoc6Hq34
         jvmSfOQsYl4i5KHoZPMdTbO7fDY/v8ri0d4I2JsIbE2vobMx4dtGy0fNYfF07EVIlkrf
         aVSfBmhiyw4Cz3p4jnesR1ek2qPPVZ0fzSoe5RHn7uCl7xsSFRUwFrjGjxK9h2QtgIdJ
         Aj6ZrDcoNB2P9/KtQdsvM4kdHeDjhUqdL/JZ7stwPdGXOCt1QqoF2pSSVyODBvp2XTT3
         pEnA==
X-Forwarded-Encrypted: i=1; AJvYcCU0NeiRdAvNrFpO+IFvXsctdH1Uazgi0ZoZBU9wr/vXvHj0d2PA7N7QYW7cNCxP/4iyNlwFtS5f5Qs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoNcuv4j/CS1//CzHSSbYa6hYyfJdO7HOGKcWCRUyikB5lP/7Q
	jA/HrlT0nJXfqLXr7VVay23PoeehYiA0mBWP3glLqzshxxxjZt/q2maO3t+71su+dQM6QRuCnNQ
	HQFIuOPXK1Jik1D9/noprbv5Repm/FfleFmajRJrMip2bk2WcJ882gZKc4v50+w==
X-Gm-Gg: ATEYQzwzodDKDgcdIkQT3D+CvR6cpvECOyVjJTsmO3H6xZNJsTuV6Ad3wBGAHV1//t1
	xPGg2HjvDgDQbk+AC1Zdmliwlov2fEVEjJgS6Tm7UIdZXoyPBBEf6v09+FnVN26camnyWrRuPoK
	FqjYBhGQbzg5sR5r6sKhNHxN8zk0ezy9gyXJ0CrWxLC+Mgg4s6dG2lBS5q7W/6rOWlocqfzbCz+
	0+Ue3ySranLbTE5AUOt0BvunsFosslopZJGVkO6LF6kMEvvqMhoLl7DC8y1ufAJeES+umyZ9IYu
	xB2tPqb8g3tV7PUNxNEWkCJYg4O4ku6M4qe//vtindhpkFoG7XuwKcee2aEklQSvLSYyesJMjou
	YmGVW2KdOK7AgXMWeHVMbRzdLsh5SOZAFv4CsqxGCxDtGjf1+OaZ+ZZZq
X-Received: by 2002:ac8:7dc1:0:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-508f46e67d2mr142736361cf.8.1773068286418;
        Mon, 09 Mar 2026 07:58:06 -0700 (PDT)
X-Received: by 2002:ac8:7dc1:0:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-508f46e67d2mr142735841cf.8.1773068285876;
        Mon, 09 Mar 2026 07:58:05 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-509009ad4basm50577251cf.11.2026.03.09.07.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:58:05 -0700 (PDT)
Date: Mon, 9 Mar 2026 10:58:03 -0400
From: Brian Masney <bmasney@redhat.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 03/10] clk: fixed-factor: Rework initialization with
 parent clocks
Message-ID: <aa7f-yq6e4WpxNrU@redhat.com>
References: <20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com>
 <20260304-clk-eyeq7-v4-3-9d6bd9d24bec@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304-clk-eyeq7-v4-3-9d6bd9d24bec@bootlin.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Wed, Mar 04, 2026 at 04:25:17PM +0100, Benoît Monin wrote:
> Use the same sequence as clk-divider, clk-gate and other to set the
> parent_names, parent_hws and parent_data in the init struct when
> registering a fixed-factor clock. The number of parent clocks is now
> only set to one if a parent clock is provided.
> 
> Previously the number of parent clocks was always one, forcing callers
> of __clk_hw_register_fixed_factor() to provide a dummy parent_data
> struct with an invalid clock index in case they were not provided with
> a non-NULL parent_name or parent_hw. Drop this dummy parent_data as is
> not necessary anymore.
> 
> This change only has a small impact on mis-configured fixed-factor. Now a
> call to clk_hw_register_fixed_factor() with a NULL parent will register
> a fixed-factor with zero parent while previously it was registered with
> one invalid parent. In both cases the rate of the fixed-factor is 0Hz
> but it is no longer shown as orphaned.
> 
> This has no impact on properly configured fixed-factors clocks.
> 
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

