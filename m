Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.75.44.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445957;
	b=MNjcg7gYYaS/bMzo10effpZ+P8sy/1ok5VqLK1PXbdCXAbrQWW5pujJroEBIDDg9p3Gw
	 fZocRxQ5MQyfsukown5C8B21R5o88xuhRFxKm7T+TQQPOXZTCqx8RC/GVGiQjOcM1vxEZ
	 eSefkle4DFOJoSrNweLEkMhCy7OEnL7+GsnY93UGy5jjDfwNXWSuedLuMRKzAGKiva60Y
	 GwqG62rtfvruPrlbRPVvpM3wDkhjJPxMhoUCou1OFtivxv9fyZj+cS/jfAtv5vWtyETp4
	 fKpmYDbSf9epE8dGhdFMmAsfB/Y46S8o3TEssiCCgMcOw84wLnI1Tm2RiGGGiRYWPlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445957;
	h=DMARC-Filter:Received:X-Originating-IP:Date:X-CM-HeaderCharset:From:
	 To:Cc:Subject:X-Priority:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	 X-Coremail-Locale:X-CM-TRANSID:X-CM-SenderInfo:X-Coremail-Antispam;
	bh=gXwNq+wrNEU9TijRwh8wJ/8LjCN/+70P6xKK8wwzMhA=;
	b=MjIk+t4RhIMq4xwA9X4OEg4vzvVnPSiLey8JEtB81AG/c9i2C+mUbrvcFamtVxfkkUle
	 UoJ9a12NsjivscrLNLVWwgpwR06UiiVutZXQ/BGNnHfuGnsD40+EhaDOub6iRH1rauuo/
	 sYKDrncFPP9GkWGi9zDtQ6m8bIfAMap+5Go9OWhi61jm+HaPJs1LjHKihQbcz2QHbB5+0
	 C3v9O1PYiQLHGsfaTcFu8b5pkPoHuj0MZNQuzyCetdcLhJAtv+Rjl7yKsnUKBz8HrFZu5
	 rJQQwRsKKJqk9GQMxHdXdwuR0GH+sQq7roYZ8foZ//tFzVjR1qZ1zH+TsmImi1ApAXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=eswincomputing.com;
	spf=pass smtp.mailfrom=eswincomputing.com;
	arc=none smtp.remote-ip=13.75.44.102
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1309E606A324;
	Thu, 12 Nov 2026 01:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1309E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from dongxuyang$eswincomputing.com ( [10.12.96.41] ) by
 ajax-webmail-app2 (Coremail) ; Thu, 12 Nov 2026 09:12:05 +0800 (GMT+08:00)
Date: Thu, 12 Nov 2026 09:12:05 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Xuyang Dong" <dongxuyang@eswincomputing.com>
To: "Han Gao" <gaohan@iscas.ac.cn>,
	"Yifeng Huang" <huangyifeng@eswincomputing.com>,
	"Stephen Boyd" <sboyd@kernel.org>,
	"Brian Masney" <bmasney+clk@redhat.com>,
	"Jerome Brunet" <jbrunet+clk@baylibre.com>
Cc: "Brian Masney" <bmasney@redhat.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	"Min Lin" <linmin@eswincomputing.com>,
	"Pinkesh Vaghela" <pinkesh.vaghela@einfochips.com>,
	"Pritesh Patel" <pritesh.patel@einfochips.com>,
	"Han Gao" <rabenda.cn@gmail.com>
Subject: Re: [PATCH] clk: eswin: Keep the TCU AXI clock enabled
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20261110-eic7700-tcu-aclk-v1-1-72db82bf59c1@iscas.ac.cn>
References: <20261110-eic7700-tcu-aclk-v1-1-72db82bf59c1@iscas.ac.cn>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <b81e73b.6e7.1a1cd4fdbb8.Coremail.dongxuyang@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:TQJkCgAnPqFlEvVqyMiJAA--.15625W
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/1tbiAgEJAmr0mS0Ic
	gAAsY
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

PiAKPiBUaGUgU01NVSBUQ1UgbmVlZHMgaXRzIEFYSSBjbG9jayBmb3IgRE1BLCBldmVuIGluIGJ5
cGFzcyBtb2RlLiBObyBkcml2ZXIKPiBjbGFpbXMgdGhpcyBjbG9jaywgc28gY2xrX2Rpc2FibGVf
dW51c2VkKCkgZ2F0ZXMgaXQgYW5kIERNQSB0aHJvdWdoIHRoZQo+IFNNTVUgc3RhbGxzLiBPbiB0
aGUgSGlGaXZlIFByZW1pZXIgUDU1MCwgdGhpcyBoYW5ncyBmaXJtd2FyZSBsb2FkaW5nIG9mCj4g
YW4gUlg1NTAgZ3JhcGhpY3MgY2FyZC4KPiAKPiBNYXJrIHRoZSBjbG9jayBhcyBjcml0aWNhbC4K
PiAKPiBGaXhlczogY2Q0NGYxMjdjMWQ0ICgiY2xrOiBlc3dpbjogQWRkIGVpYzc3MDAgY2xvY2sg
ZHJpdmVyIikKPiBTaWduZWQtb2ZmLWJ5OiBIYW4gR2FvIDxnYW9oYW5AaXNjYXMuYWMuY24+Cj4g
LS0tCj4gVGVzdGVkIG9uIHRoZSBIaUZpdmUgUHJlbWllciBQNTUwIHdpdGggYW4gUlg1NTAgZ3Jh
cGhpY3MgY2FyZDoKPiAKPiAtIFdpdGhvdXQgdGhpcyBwYXRjaCwgYW1kZ3B1IHN0YWxscyB3aGls
ZSBsb2FkaW5nIHRoZSBSWDU1MCBmaXJtd2FyZQo+ICAgYW5kIENQVXMgY2FuIG5vIGxvbmdlciBi
ZSBoYWx0ZWQuCj4gLSBXaXRoIG9ubHkgdGhlIFRDVSBBWEkgY2xvY2sga2VwdCBlbmFibGVkICh0
aGUgVENVIGNvbmZpZ3VyYXRpb24gY2xvY2sKPiAgIGlzIHN0aWxsIG1hbmFnZWQgbm9ybWFsbHkp
LCBhbWRncHUgaW5pdGlhbGl6ZXMgYW5kIHRoZSBJQiByaW5nIHRlc3RzCj4gICBwYXNzIHdpdGhv
dXQgYW55IG1hbnVhbCByZWdpc3RlciB3cml0ZXMuCj4gLS0tCj4gIGRyaXZlcnMvY2xrL2Vzd2lu
L2Nsay1laWM3NzAwLmMgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9lc3dpbi9jbGst
ZWljNzcwMC5jIGIvZHJpdmVycy9jbGsvZXN3aW4vY2xrLWVpYzc3MDAuYwo+IGluZGV4IDQzYTQ3
ZmUxNmFiMTRhZTFkMWNhY2MzYTBkYTAyMDNlNDEyNTQxYzAuLjdjOTUwNTVmMTNlYjc4MmEwMzcy
M2U0NDc1ZDYzMDYwZDM3NzExYWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsvZXN3aW4vY2xr
LWVpYzc3MDAuYwo+ICsrKyBiL2RyaXZlcnMvY2xrL2Vzd2luL2Nsay1laWM3NzAwLmMKPiBAQCAt
ODMyLDggKzgzMiwxMCBAQCBzdGF0aWMgc3RydWN0IGVzd2luX2Nsa19pbmZvIGVpYzc3MDBfY2xr
c1tdID0gewo+ICAJRVNXSU5fR0FURV9UWVBFKEVJQzc3MDBfQ0xLX0dBVEVfRDJEX0NGR19DTEss
ICJnYXRlX2QyZF9jZmdfY2xrIiwKPiAgCQkJRUlDNzcwMF9DTEtfTVVYX1NZU0NGR19DTEtfUk9P
VF8yTVVYMV9HRlJFRSwKPiAgCQkJQ0xLX1NFVF9SQVRFX1BBUkVOVCwgRUlDNzcwMF9SRUdfT0ZG
U0VUX0QyRF9DRkcsIDMxLCAwKSwKPiArCS8qIERNQSB0aHJvdWdoIHRoZSBTTU1VIHN0aWxsIG5l
ZWRzIHRoZSBUQ1UgQVhJIGNsb2NrIGluIGJ5cGFzcyBtb2RlLiAqLwo+ICAJRVNXSU5fR0FURV9U
WVBFKEVJQzc3MDBfQ0xLX0dBVEVfVENVX0FDTEssICJnYXRlX3RjdV9hY2xrIiwKPiAtCQkJRUlD
NzcwMF9DTEtfRElWX0REUl9BQ0xLX0RZTk0sIENMS19TRVRfUkFURV9QQVJFTlQsCj4gKwkJCUVJ
Qzc3MDBfQ0xLX0RJVl9ERFJfQUNMS19EWU5NLAo+ICsJCQlDTEtfU0VUX1JBVEVfUEFSRU5UIHwg
Q0xLX0lTX0NSSVRJQ0FMLAo+ICAJCQlFSUM3NzAwX1JFR19PRkZTRVRfVENVX0FDTEssIDMxLCAw
KSwKPiAgCUVTV0lOX0dBVEVfVFlQRShFSUM3NzAwX0NMS19HQVRFX1RDVV9DRkdfQ0xLLCAiZ2F0
ZV90Y3VfY2ZnX2NsayIsCj4gIAkJCUVJQzc3MDBfQ0xLX01VWF9TWVNDRkdfQ0xLX1JPT1RfMk1V
WDFfR0ZSRUUsCj4gCgpBY2tlZC1ieTogWHV5YW5nIERvbmcgPGRvbmd4dXlhbmdAZXN3aW5jb21w
dXRpbmcuY29tPgoKVGhhbmtzLApYdXlhbmcgRG9uZwo=
