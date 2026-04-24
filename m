Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4203F787F
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 18:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777056862; cv=none; b=VP3WfL8J89fj8+ZQYH5YzDn0AGtgAEh6K2eB/r79nopibC0EbKDUTlJdywidE+/EBSSkyMmLa50fpjL4zU1rSOvz+8cm8HN6wOyyR4MP8XeNi/fW64bqtuMxWihEykuIGKYpHFT+6c1Z80DQ8nyvV5Eo3qmkz13fb6zrcGWyFoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777056862; c=relaxed/simple;
	bh=xVEb4qSclTbInsRR3yFG61G/9vCF/i7x/vxBHtt4LtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3kJna5n1ZpB1q0Kkczm+T7075COLV+KevhBKuRxAjOaw1Wce+VFu93gnWME/ABlmleeGB/Shtirc+B65FBvFI2aVITA0w9dNpsUJYGSgat5B3cGPi2F7Xddv264CLCmHsEPjduR7MGl6AgkO1g5W/KnGzilW2cmNGlgdCBbGb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BX2+q+93; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=t7+oTq39; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BX2+q+93";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="t7+oTq39"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777056860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H/9A7iuFrOYMmAapoPc+GFqNn3p54vDLrt5ol9PNJ3Y=;
	b=BX2+q+93Aeb/IXfUW+GWCv0KS3JXOEV1ePqUa1Xo6tNGJzAXEYmuzNuPD7WVgbYyvVx+F6
	LaaVw2EqRbJvDDLOzykKe5zQzkBXuHr49bg+M6w9UOtrJqwgH2Ls0NIhfNIENwy84bQ0O4
	SpNlgUPTTP4inMQo5V09a1Twq4qjlng=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-qEdmnwWbP8CEZvVF9v3qnA-1; Fri, 24 Apr 2026 14:54:18 -0400
X-MC-Unique: qEdmnwWbP8CEZvVF9v3qnA-1
X-Mimecast-MFC-AGG-ID: qEdmnwWbP8CEZvVF9v3qnA_1777056858
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e575a50bcso79993761cf.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 11:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777056858; x=1777661658; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H/9A7iuFrOYMmAapoPc+GFqNn3p54vDLrt5ol9PNJ3Y=;
        b=t7+oTq39/9ktKnrlV3rO6odYeU+aYdT3x6c26ppxkGOKOx0RHDM8iy5SZCynfvXrDe
         +V+wqrGtC7EDhOu3nqMJrHnlVcmjswWeuvaEr2+UQLEqvrnAzrjGo8abxtOEeCtVJ0S3
         jQmQ+gfObTu+KodtniPC+a7sAYTgryEC0gUCa4l8NSH0zq1SVB4WMq8eU1zVKbW8ySzq
         W/KiT7sB5GzGoIcHcdINX4bCGWLes0cJiXRT5ytIyEErNb4Dsh9Y7EduwD+KrFjZSlct
         S0wex7IgtwwxKFq7K6gVUueYa9lqfLiV5hBj4Dqj1R9J6pBA6RP3QW4PeayYuF/hjfqD
         VRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777056858; x=1777661658;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/9A7iuFrOYMmAapoPc+GFqNn3p54vDLrt5ol9PNJ3Y=;
        b=l1lwwyvKu0eFq3dh+prK+E8A1pW4C1+vkRBcHuMhtmhxTM7AKcmy5LTRcdiggTm5Q2
         p6XP/pHPBs5vxWPyuEstwxBvNHPPQXJkgAnDC77qyOqdwfa7Q8orkPZh1/3vGn3dV6dO
         gqkpmlgQimHcYqVmnIqOdzggn6AFbxH5Y5l+HHKfDfeOMZUBNiWeQ6esCWNpi05xU3K1
         D3rZXkJ9NyY8/wZZC524dqEUNDTqiDugm9BehiKfwBgi6YGwrlvWEYIqY4Y8NVjQOHQP
         +C5y99RLC1+ggSDBECKcbtdSRN5j7xo9Toi4olMPE5d3JOXfQTbHlaiI9ZagrYU4PNOL
         BJbQ==
X-Gm-Message-State: AOJu0YyEep1Igre3cJO6VefaGUWOnW/Jd6g0NEGam6+sc3Xy/09dOIR2
	FAQS8SmfJE6B1qWPnKN0P4h7C4SSbeA6XXAV0DdW1FZU4jcyQoV4R3Z0TMeToC3gbsbWWf8EeVy
	NXPEWTAzjRxkbyWHSM0+fOCZWZg2XXMKp41QreT6BIVNxJsFne8M8LbtWw/54hA==
X-Gm-Gg: AeBDieuye0P8FhplaJ5I6VDiTtSD/KHwQBW8kZAqn7VCxAEEk5BJ/fV3REjAjmPoXwr
	yYlH4oGTbTosX1pj/G9znGDFXCmRJY7Cwdh+lF5Lp0VMzKWGvQ3e/9gK6WtLT5rsr/YA7Qh0p3r
	voQsS3WzWgJ3cvBU3qIaXrNUZbfmJmuPEHfwqSx/h6cSnK1K/HiSS2K5EBYAbl3hMAGAbuUl6dX
	qZgW3Ir8v9jPhIUfzOx03DvliwzvcOghtPHZY3ptB4nWfme2Cv+WC9PuG5wOT4DJsQahfPyGy4X
	MmfnX6qA7EXj39Ucm0oCm7A1vwgkaG6xEf3YYxXS6ui6NMW9Lyszoqjsk687gXMHbX5pvwt1bdl
	dOkl/M4E8l2g84oSaPrzuRCozPqGsFivGemvuLOpZLy8P3M6ylH6Bd2Gbud7T2tbH45s=
X-Received: by 2002:a05:622a:858b:b0:50e:5ca9:d25a with SMTP id d75a77b69052e-50e5ca9d6cemr270059131cf.10.1777056858072;
        Fri, 24 Apr 2026 11:54:18 -0700 (PDT)
X-Received: by 2002:a05:622a:858b:b0:50e:5ca9:d25a with SMTP id d75a77b69052e-50e5ca9d6cemr270058861cf.10.1777056857584;
        Fri, 24 Apr 2026 11:54:17 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fb92db861sm98432901cf.5.2026.04.24.11.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 11:54:17 -0700 (PDT)
Date: Fri, 24 Apr 2026 14:54:15 -0400
From: Brian Masney <bmasney@redhat.com>
To: nuno.sa@analog.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH RESEND] clk: clk-axi-clkgen: Add support versal timings
Message-ID: <aeu8V83mqUdNfGmH@redhat.com>
References: <20260424-clk-axi-clk-versal-support-v1-1-ea070f83db7e@analog.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260424-clk-axi-clk-versal-support-v1-1-ea070f83db7e@analog.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Fri, Apr 24, 2026 at 06:29:04PM +0100, Nuno Sá via B4 Relay wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> Add proper VCO and PFD limits for versal based platforms. For that we
> need to add new Technology and Speed grade defines.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

